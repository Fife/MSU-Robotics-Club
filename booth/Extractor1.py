import xml.etree.ElementTree as ET

tree = ET.parse('GPR-antenna.argos')
root = tree.getroot()

def getTitle(root):
    for child in root:
        if child.tag == 'gprMax':
            return(child.attrib['title'])

def getArenaSize(root):
    for child in root:
        if child.tag == 'arena':
            return(child.attrib['size'])
        
def getDxDyDz(root):
    for parent in root:
        if parent.tag == 'gprMax':
            for child in parent:
                if child.tag == 'gpr_essential': 
                    return(child.attrib['dx_dy_dz'])
        
def getTime_Window(root):
    for parent in root:
        if parent.tag == 'gprMax':
            for child in parent:
                if child.tag == 'gpr_essential': 
                    return(child.attrib['time_window'])
                
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

betterMaterials(root)

def getWaveform(root):
    for parent in root:
        if parent.tag == 'gprMax':
            for child in parent:
                if child.tag == 'waveform': 
                    return(child.attrib['type'],child.attrib['max_amplitude'],child.attrib['center_freq'],child.attrib['id'])

title=getTitle(root)
gprTitle='#title: ' + title

size=getArenaSize(root)
gprDomain='#domain: ' + size.replace(',','')

dx_dy_dz=getDxDyDz(root)
gprDxDyDz='#dx_dy_dz: ' + dx_dy_dz.replace(',','')

time_window=getTime_Window(root)
gprTime_Window='#time_window: ' + time_window

waveform=getWaveform(root)
#gprWaveform='#waveform: ' + waveform

#getMaterials(root)

success = open("gprDomain.txt", "w")
success.write(gprTitle)
success.write("\n")
success.write(gprDomain)
success.write("\n")
success.write(gprDxDyDz)
success.write("\n")
success.write(gprTime_Window)
success.write("\n")
success.write("\n")
#success.write(gprMaterials)
success.write("\n")
success.write("\n")


success.close()
