import getopt, sys
from Extractor1 import * 

#Only argument is the path of the argos experiment file

try:
  experiment_path = sys.argv[1]
  
except IndexError:
  print("Erorr, Nothing was passed in as an argument.")
  
else:
  experiment_path = sys.argv[1]
  root = getRoot(experiment_path)
  writeInit(root)
  

