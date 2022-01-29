import getopt, sys
from Extractor1 import * 

#Only argument is the path of the argos experiment file

experiment_path = sys.argc[1]

root = getRoot(sys.argc[1])
print(getTitle(root))

