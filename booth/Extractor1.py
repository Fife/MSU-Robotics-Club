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
               
title=getTitle(root)
gprTitle='#title: ' + title

size=getArenaSize(root)
gprDomain='#domain ' + size.replace(',','')

success = open("gprDomain.txt", "w")
success.write(gprTitle)
success.write("\n")
success.write(gprDomain)
success.close()
print(gprTitle)
