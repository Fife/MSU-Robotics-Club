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
    return materials


def getWaveform(root):
    for parent in root:
        if parent.tag == 'gprMax':
            for child in parent:
                if child.tag == 'waveform': 
                    return(child.attrib['type'],child.attrib['max_amplitude'],child.attrib['center_freq'],child.attrib['id'])

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
                
def writeInit(root):
       process = [getTitle,getArenaSize,getDxDyDz, getTimeWindow]
       data = []
       for function in process:
            data.append(function(root))
            data.append('\n')
       data_string = ''.join(data)
       file = open("booth/current-sim.in", "w")
       for character in data:
            file.write(character)
       file.close()

    
#waveform=getWaveform(root)
#gprWaveform='#waveform: ' + waveform
