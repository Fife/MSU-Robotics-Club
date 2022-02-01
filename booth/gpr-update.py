import fileinput
import sys

def updateTransmitter(file_path, Tx, Ty, Tz):
    
    #Open the file at the specified path and read it in to a variable
    file = open(file_path, "r")
    file_content = file.readlines()
    
    #Create an empty list to store the modified file
    updated_file=[]
    
    #Loop through to find the line of the Transmitter and write the updated line to the new file
    for line in file_content:
        if "#hertzian_dipole" in line:
            transmitter = line.split()
            transmitter[2] = str(Tx)
            transmitter[3] = str(Ty)
            transmitter[4] = str(Tz)
            new_output = ' '.join(transmitter)
            updated_file.append(new_output.lstrip(' '))
            updated_file.append("\n")
        else:
            updated_file.append(line.lstrip(' '))
    file.close()
    
    #Join the list of lines into one big line
    final_output = ''.join(updated_file)

    # Write the updated file in place of the old file
    fout = open(file_path, "w")
    fout.write(final_output)
    fout.close()        

