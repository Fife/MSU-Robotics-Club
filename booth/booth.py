import getopt, sys
from Extractor1 import * 

#Only argument is the path of the argos experiment file

experiment_path = sys.argv[1]

try:
  experiment_path = sys.argv[1]
  
except IndexError:
  print("Nothing was passed in as an argument")
  
else:
  root = getRoot(experiment_path)
  try:
    generateIN(root)
    
  except:
    print(experiment_path, "is an invalid experiment path")
    
  else:
    # The root is the XML tree of the experiment.
    # If the xml has succussfully been parsed:
    #   Generate the .in file for gprMax
    print(getTitle(root))
    
  

