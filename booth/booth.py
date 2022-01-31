import getopt, sys
from quickxmltest import * 

#Only argument is the path of the argos experiment file

try:
  experiment_path = sys.argv[1]
  
except IndexError:
  print("Erorr, Nothing was passed in as an argument.")
  
else:
  try:
    root = getRoot(experiment_path)
    
  except:
    print(experiment_path, "is an invalid experiment path")
    
  else:
    # The root is the XML tree of the experiment.
    # If the xml has succussfully been parsed:
    #   Generate the .in file for gprMax
    print(getTitle(root))
  

