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
    
    output = "\n"
    for substance in materials:
        output += "#material: "
        output += substance['relative_permittivity'] + " "
        output += substance['conductivity'] + " "
        output += substance['relative_permeability'] + " "
        output += substance['magnetic_loss'] + " "
        output += substance['id'] + "\n"
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
    output = correctDipole(root, output)
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
        final_output = correctRx(root, output.replace(",", " "))
        return final_output

def getResources(root):
    resources = root.findall("./gprMax/subsurface_resources/resource")
    output = "\n"
    for resource in resources:
    	if resource.attrib['argos_id'] == "arena":
    	    arena = getSubsurfaceDomain(root)
    	    output += correctCube(root, arena) + resource.attrib['material_id'] + "\n"
    	else:
    	    name = resource.attrib['argos_id']
    	    insert = "@id='"+ name +"'"
    	    #Get the geometry that has the name of the current resource
    	    cylinder = root.find("./arena/cylinder["+ insert +"]")
    	    box = root.find("./arena/box/["+ insert + "]")
    	    #Perform cylinder/box transformation
    	    if box: 
    	        position = box.find("./body").attrib["position"].split(",")
    	        position = [float(number) for number in position]
    	        size = box.attrib["size"].split(",")
    	        size = [float(number) for number in size]
    	        transform = cube_matrix(size, position)
    	        bottom = ' '.join(str(e) for e in transform[0])
    	        top = ' '.join(str(e) for e in transform[1])
    	        line = "#box: "+bottom +" "+ top 
    	        output += correctCube(root, line)+" "+ resource.attrib['material_id'] + "\n"
    	    else:
    	    	orientation = cylinder.find("./body").attrib["orientation"].split(",")
    	    	orientation = [float(number) for number in orientation]
    	    	position = cylinder.find("./body").attrib["position"].split(",")
    	    	position = [float(number) for number in position]
    	    	radius = cylinder.attrib["radius"]
    	    	height = float(cylinder.attrib["height"])
    	    	transform = cylinder_matrix(height, position, orientation)
    	    	
    	    	bottom = ' '.join(str(e) for e in transform[0])
    	    	top = ' '.join(str(e) for e in transform[1])
    	    	line = "#cylinder: "+bottom +" "+ top +" "+ radius + " "+ resource.attrib['material_id']
    	    	output += correctCylinder(root, line)+ "\n"
    return output


def getSubsurfaceDomain(root):
    #Get the dimensions of the subsurface domain
    size_string = getArenaSize(root)
    size_string = size_string.replace("#domain: ", "" )
    size_list = size_string.split(" ")
    print(size_list)
    center_string = getArenaCenter(root)
    center_list = center_string.split(" ")
    
    #list comprehension to get numbers
    size = [float(number) for number in size_list if number != " "]
    center = [float(number) for number in center_list]
    subDomain = calculateSubBox(size, center)
    
    return (writeBox(subDomain[0], subDomain[1]))

def getSubsurfaceBias(root):
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
    return subDomain[0]

        
def writeBox(bottom_left, top_right):
    data = "#box: "
    for point in bottom_left:
        data = data + str(point) + ' '
    for point in top_right:
        data = data + str(point) + ' '	
    return data

def correctRx(root, str_input):
    #get the input and bias point
    bias_point = getSubsurfaceBias(root)
    line_list = str_input.split(' ')
    rx = line_list[0]
    args = ''
    if len(line_list) > 4:
    	args = ' '.join(str(e) for e in line_list[3:])
    point_list = line_list[1:4]
    
    #cast the points to float and split them so that we can do math 
    point_list = [float(entry) for entry in point_list]
    
    biased_rx = offsetCorrect(point_list, bias_point)
    points =' '.join(str(e) for e in biased_rx)
    output = rx + ' ' + points + args
    return output
    
def correctDipole(root, str_input):
    #get the input and bias point
    bias_point = getSubsurfaceBias(root)
    line_list = str_input.split(' ')
    pre_args = ' '.join(str(e) for e in line_list[:2])
    post_args = ' '.join(str(e) for e in line_list[5:])
    point_list = line_list[2:5]

    #cast the points to float and split them so that we can do math 
    point_list = [float(entry) for entry in point_list]
    
    biased_rx = offsetCorrect(point_list, bias_point)
    points =' '.join(str(e) for e in biased_rx)
    output = pre_args + ' ' + points + ' ' + post_args
    return output    
    

def correctCube(root, str_input):
    #get the input and bias point
    bias_point = getSubsurfaceBias(root)
    line_list = str_input.split(' ')
    
    #save the geometry type and material for later
    material = ' '.join(line_list[7:])
    geometry = line_list[0]
    line_list = line_list[1:7]
    
    #cast the points to float and split them so that we can do math 
    point_list = [float(entry) for entry in line_list]
    bottom = point_list[0:3]
    top = point_list[3:6]
    
    #Create New Points
    biased_geometry = [offsetCorrect(bottom,bias_point), offsetCorrect(top,bias_point)]
    
    #output back as a string in the gprmax format
    bl = [str(entry) for entry in biased_geometry[0]]
    tr = [str(entry) for entry in biased_geometry[1]]
    
    out_list = bl+tr
    out_list.insert(0, geometry)
    out_list.append(material)
    output = ' '.join(str(e) for e in out_list)

    return output
   
def correctCylinder(root, str_input):
    #get the input and bias point
    bias_point = getSubsurfaceBias(root)
    line_list = str_input.split(' ')
    
    #save the geometry type and material for later
    material = ' '.join(line_list[7:])
    geometry = line_list[0]
    line_list = line_list[1:7]
    
    #cast the points to float and split them so that we can do math 
    point_list = [float(entry) for entry in line_list]
    bottom = point_list[0:3]
    top = point_list[3:6]
    
    #Create New Points
    biased_geometry = offsetCorrect(bottom,bias_point) + offsetCorrect(top,bias_point)
    biased_geometry = [round(i, 4) for i in biased_geometry]
        
    #output back as a string in the gprmax format
    
    out_list = biased_geometry
    out_list.insert(0, geometry)
    out_list.append(material)
    output = ' '.join(str(e) for e in out_list)

    return output
            
                        
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
        getResources
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

#root = getRoot("submissions/bisectional-scan.argos")
#print(getSubsurfaceDomain(root))
#print(getHertzianDipole(root))
#print(correctDipole(root, getHertzianDipole(root)))
#print(getResources(root))
#writeInit(root)
#waveform=getWaveform(root)
#gprWaveform='#waveform: ' + waveform
#print(writeInit(getRoot("GPR-antenna.argos")))

