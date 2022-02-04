import xml.etree.ElementTree as ET

#tree = ET.parse('GPR-antenna.argos')
#root = tree.getroot()

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

#betterMaterials(root)

def getWaveform(root):
    for parent in root:
        if parent.tag == 'gprMax':
            for child in parent:
                if child.tag == 'waveform': 
                    return(child.attrib['type'],child.attrib['max_amplitude'],child.attrib['center_freq'],child.attrib['id'])

                
def writeInit(root):
       process = [getTitle,getArenaSize,getDxDyDz, getTimeWindow]
       data = []
       for function in process:
            data.append(function(root))
            data.append('\n')
       data_string = ''.join(data)
       file = open("current_sim.in", "w")
       for character in data:
            file.write(character)
       file.close()
    
def getRoot(path):
	tree = ET.parse(path)
	root = tree.getroot()
	return root
    
#waveform=getWaveform(root)
#gprWaveform='#waveform: ' + waveform
