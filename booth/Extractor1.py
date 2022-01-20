import xml.etree.ElementTree as ET

tree = ET.parse('GPR-antenna.xml')
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
                    for grandchild in child:
                        if grandchild.tag == 'material':
                            material=""
                            for attribute in grandchild:
                                material.append(attribute)
                                print(attribute)
                            return(material)
                
title=getTitle(root)
gprTitle='#title: ' + title

size=getArenaSize(root)
gprDomain='#domain: ' + size.replace(',','')

dx_dy_dz=getDxDyDz(root)
gprDxDyDz='#dx_dy_dz: ' + dx_dy_dz.replace(',','')

time_window=getTime_Window(root)
gprTime_Window='#time_window: ' + time_window

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

success.close()
print(getMaterials(root))
