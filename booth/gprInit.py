import getopt, sys
from Extractor1 import * 
from gpr-update import *

#Only argument is the path of the argos experiment file

try:
  experiment_path = sys.argv[1]
  
except IndexError:
  print("Erorr, Nothing was passed in as an argument.")
  
else:
  experiment_path = sys.argv[1]
  try:
    root = getRoot(experiment_path)
  except:
    print(experiment_path, "is an invalid experiment path")
    
  else:
    # The root is the XML tree of the experiment.
    # If the xml has succussfully been parsed:
    #   Generate the .in file for gprMax
    root = getRoot(experiment_path)
    print(getTitle(root))
  

