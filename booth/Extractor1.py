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
        
def getTimeWindow(root):
    for child in root:
        if child.tag == 'gpr_essential':
            return(child.attrib['time_window'])

               
title=getTitle(root)
gprTitle='#title: ' + title

size=getArenaSize(root)
gprDomain='#domain ' + size.replace(',','')

dx_dy_dz=getDxDyDz(root)
#gprDxDyDz='#dx_dy_dz: ' + dx_dy_dz

success = open("gprDomain.txt", "w")
success.write(gprTitle)
success.write("\n")
success.write(gprDomain)
success.write("\n")
#success.write(gprDxDyDz)
success.close()
print(getDxDyDz(root))

