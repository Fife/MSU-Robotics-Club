import getopt, sys
from Extractor1 import * 

#Only argument is the path of the argos experiment file

experiment_path = sys.argv[1]

root = getRoot(experiment_path)

print(getTitle(root))

