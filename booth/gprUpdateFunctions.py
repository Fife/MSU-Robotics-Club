import fileinput
import sys
from Extractor1 import * 

def updateTRx(file_path, Tx, Ty, Tz, Rx, Ry, Rz):
    root = getRoot("booth/current-sim.argos")

    #Open the file at the specified path and read it in to a variable
    exp_file = open(file_path, "r")
    file_content = exp_file.readlines()
    
    #Create an empty list to store the modified file
    updated_file=[]
    
    #Bias The points
    bias = getSubsurfaceBias(root) 
    biased_Tx = offsetCorrect([float(Tx), float(Ty), float(Tz)], bias)
    biased_Rx = offsetCorrect([float(Rx), float(Ry), float(Rz)], bias)
    
    #Loop through to find the line of the Transmitter and write the updated line to the new file
    for line in file_content:
        if "#hertzian_dipole" in line:
            new_output = replaceTx(biased_Tx[0], biased_Tx[1], biased_Tx[2], line)
            updated_file.append(new_output)
            updated_file.append("\n")
        elif "#rx" in line:
            new_output = replaceRx(biased_Rx[0], biased_Rx[1], biased_Rx[2], line)
            updated_file.append(new_output)
            updated_file.append("\n")
        else:
            updated_file.append(line)
    exp_file.close()
    
    #Join the list of lines into one big line
    final_output = ''.join(updated_file)

    # Write the updated file in place of the old file
    fout = open(file_path, "w")
    fout.write(final_output)
    fout.close()        


def replaceTx(Tx, Ty, Tz, transmitter):
    transmitter = transmitter.split()
    transmitter[2] = str(Tx)
    transmitter[3] = str(Ty)
    transmitter[4] = str(Tz)
    new_output = ' '.join(transmitter)
    return new_output

def replaceRx(Rx, Ry, Rz, receiver):
    receiver = receiver.split()
    receiver[1] = str(Rx)
    receiver[2] = str(Ry)
    receiver[3] = str(Rz)
    new_output = ' '.join(receiver)
    return new_output

def trxUpdateTest():
    file_path = 'current-sim.in'
    updateTRx(file_path, 0.15,4.20,1.52, 0,0,0)

    myString = "#hertzian_dipole: z 0.100 0.170 0 my_ricker\n"
    myRec = "#rx: 0.140 0.170 0\n"

    print(replaceTx(0,0,0, myString))
    print(replaceRx(0,0,0, myRec))

