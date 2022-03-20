import xml.etree.ElementTree as ET
from geometry_conversion import *


def getTitle(root):
    for child in root:
        if child.tag == 'gprMax':
            output = '#title: ' + child.attrib['title']
            return output
    return None

def getArenaSize(root):
    for child in root:
        if child.tag == 'arena':
            center=child.attrib['size']
            return('#domain: ' +center.replace(',',' '))
    return None
    
def getArenaCenter(root):
    for child in root:
        if child.tag == 'arena':
            size=child.attrib['center']
            return(size.replace(',',' '))
    return None    
                 
        
def getDxDyDz(root):
    for parent in root:
        if parent.tag == 'gprMax':
            for child in parent:
                if child.tag == 'gpr_essential':
                    dx_dy_dz=child.attrib['dx_dy_dz']
                    return('#dx_dy_dz: ' + dx_dy_dz.replace(',',''))
    return None
        
def getTimeWindow(root):
    for parent in root:
        if parent.tag == 'gprMax':
            for child in parent:
                if child.tag == 'gpr_essential': 
                    return('#time_window: ' + child.attrib['time_window'])
    return None         
                    
def betterMaterials(root):
    material_list = root.findall("./gprMax/materials/material")
    materials = []
    for material in material_list:
        materials.append(material.attrib)
    
    output = ""
    for substance in materials:
        output += "#material: "
        output += substance['relative_permittivity'] + " "
        output += substance['conductivity'] + " "
        output += substance['relative_permeability'] + " "
        output += substance['magnetic_loss'] + " "
        output += substance['id'] + " "
        output +="\n"
    return output


def getWaveform(root):
    for parent in root:
        if parent.tag == 'gprMax':
            for child in parent:
                if child.tag == 'waveform':
                    output = "#waveform: " + str(child.attrib['type'] + " ")+ str(child.attrib['max_amplitude'] + " ")+ str(child.attrib['center_freq']+ " ")+ str(child.attrib['id'] + " ")
                    return output
    return None

def getRoot(path):
    tree = ET.parse(path)
    root = tree.getroot()
    return root

def getHertzianDipole(root):
    dipoles = root.findall("./gprMax/hertzian_dipole")
    prototypes = root.findall("./arena/prototype")
    #Find Dipoles
    for dipole in dipoles:
        output = "#hertzian_dipole:"
        for value in dipole.attrib.values():
            output += (" " + value)
        link = dipole.attrib['link_id']
        
        for proto in prototypes:
            if proto.attrib["id"] == link:
                coordinates = proto.find("body").attrib["position"]
                coordinates = coordinates.replace(',', ' ')
                output = output.replace(link, coordinates)
    return output
 
 
def getRx(root):
    rx_list = root.findall("./gprMax/rx")
    prototypes = root.findall("./arena/")
    for rx in rx_list:
        if type(rx.attrib["id"]) is not None: rx_id = rx.attrib["id"]
        output = "#rx: "
        for proto in prototypes:
            if proto.attrib["id"] == rx_id:
                #if proto.find("body").attrib["position"] is not None:
                output += proto.find("body").attrib["position"]
        final_output = output.replace(",", " ")
        return final_output

def getResources(root):
    resources = root.findall("./gprMax/subsurface_resources/resource")
    output = ""
    for resource in resources:
    	if resource.attrib['argos_id'] == "arena":
    	    output += getSubsurfaceDomain(root) + resource.attrib['material_id'] + "\n"
    	else:
    	    name = resource.attrib['argos_id']
    	    insert = "@id='"+ name +"'"
    	    #Get the geometry that has the name of the current resource
    	    cylinder = root.find("./arena/cylinder["+ insert +"]")
    	    
    	    box = root.findall("./arena/box/")
    	    
    	    
    	    #Perform cylinder/box transformation
    	    if box: 
    	        print("")
    	    else:
    	    	orientation = cylinder.find("./body").attrib["orientation"].split(",")
    	    	orientation = [float(number) for number in orientation]
    	    	position = cylinder.find("./body").attrib["position"].split(",")
    	    	position = [float(number) for number in position]
    	    	
    	    	radius = float(cylinder.attrib["radius"])
    	    	height = float(cylinder.attrib["height"])
    	    	transform = cylinder_matrix(height, position, orientation)
    	    	
    	    	bottom = ' '.join(str(e) for e in transform[0])
    	    	top = ' '.join(str(e) for e in transform[1])
    	    	
    	    	output += "#cylinder: "+bottom +" "+ top +" "+ resource.attrib['material_id'] + "\n"
    	    #Append data to the output along with resource material ID
    	    #Make sure to check for "pec" as it doesn't need to be defined in the ARGoS file
    return output


def getSubsurfaceDomain(root):
    #Get the dimensions of the subsurface domain
    size_string = getArenaSize(root)
    size_string = size_string.replace("#domain: ", "" )
    size_list = size_string.split(" ")
    
    center_string = getArenaCenter(root)
    center_list = center_string.split(" ")
    
    #list comprehension to get numbers
    size = [float(number) for number in size_list]
    center = [float(number) for number in center_list]
    subDomain = calculateSubBox(size, center)
    
    return (writeBox(subDomain[0], subDomain[1]))

def writeBox(bottom_left, top_right):
    data = "#box: "
    for point in bottom_left:
        data = data + str(point) + ' '
    for point in top_right:
        data = data + str(point) + ' '	
    return data
                        
def writeInit(root):
    process = [
        getTitle,
        getArenaSize,
        getDxDyDz,
        getTimeWindow,
        betterMaterials,
        getWaveform,
        getHertzianDipole,
        getRx,
        getSubsurfaceDomain
        ]
    data = []
    for function in process:
        result = function(root)
        print(function(root))
        if result is not None:
            data.append(result)
            data.append('\n')
    data_string = ''.join(data)
    file = open("booth/current-sim.in", "w")
    for character in data_string:
        file.write(character)
    file.close()
    return None

#root = getRoot("booth/current-sim.argos")
#subBox = getSubsurfaceDomain(root)
#print(getResources(root))
#waveform=getWaveform(root)
#gprWaveform='#waveform: ' + waveform
#print(writeInit(getRoot("GPR-antenna.argos")))

