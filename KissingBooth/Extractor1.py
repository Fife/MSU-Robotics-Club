import xml.etree.ElementTree as ET

tree = ET.parse('SomeFile.xml')
root = tree.getroot()

def getArenaSize(root):
    for child in root:
        if child.tag == 'arena':
            return(child.attrib['size'])

size=getArenaSize(root)
gprDomain='#domain ' + size.replace(',','')

success = open("gprDomain.txt", "w")
success.write(gprDomain)
success.close()
