import xml.etree.ElementTree as ET

def getTitle(root):
    for child in root:
        if child.tag == 'gprMax':
            return('#title: ' + child.attrib['title'])

def getArenaSize(root):
    for child in root:
        if child.tag == 'arena':
            size=child.attrib['size']
            return('#domain: ' + size.replace(',',' '))
                 
        
def getDxDyDz(root):
    for parent in root:
        if parent.tag == 'gprMax':
            for child in parent:
                if child.tag == 'gpr_essential':
                    dx_dy_dz=child.attrib['dx_dy_dz']
                    return('#dx_dy_dz: ' + dx_dy_dz.replace(',',''))
        
def getTimeWindow(root):
    for parent in root:
        if parent.tag == 'gprMax':
            for child in parent:
                if child.tag == 'gpr_essential': 
                    return('#time_window: ' + child.attrib['time_window'])
                
def getMaterials(root):
    for parent in root:
        if parent.tag == 'gprMax':
            for child in parent:
                if child.tag == 'materials':
                    for grandchild in iter(child):
                        print(grandchild)
                        material_list = []
                        material_list.append(grandchild.attrib)
                        if grandchild.tag == 'material':
                            material=[]
                            #print(grandchild.attrib)
                            for attribute in grandchild.attrib:
                                #print(attribute)
                                material.append(attribute)
                        return(material_list)
                    
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

def getRoot(path):
    tree = ET.parse(path)
    root = tree.getroot()
    return root

def getHertzianDipole(root):
    dipoles = root.findall("./gprMax/hertzian_dipole")
    prototypes = root.findall("./arena/prototype")
    #Find Dipoles
    for dipole in dipoles:
        output = "#hertzian_dipole"
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
        if rx.attrib["id"] != None: rx_id = rx.attrib["id"]
        output = "#rx: "
        for proto in prototypes:
            if proto.attrib["id"] == rx_id:
                if proto.find("body").attrib["position"] != None:
                    output += proto.find("body").attrib["position"]
        output = output.replace(",", " ")
        return output
                        
def writeInit(root):
       process = [getTitle,getArenaSize,getDxDyDz, getTimeWindow, betterMaterials, getWaveform, getHertzianDipole, getRx]
       data = []
       for function in process:
            data.append(function(root))
            data.append('\n')
       data_string = ''.join(data)
       file = open("current-sim.in", "w")
       for character in data:
            file.write(character)
       file.close()

print(getRx(getRoot("GPR-antenna.argos")))
#waveform=getWaveform(root)
#gprWaveform='#waveform: ' + waveform
print(writeInit(getRoot("GPR-antenna.argos")))
