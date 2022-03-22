import fileinput
import sys

def updateTRx(file_path, Tx, Ty, Tz, Rx, Ry, Rz):
    
    #Open the file at the specified path and read it in to a variable
    file = open(file_path, "r")
    file_content = file.readlines()
    
    #Create an empty list to store the modified file
    updated_file=[]
    
    #Loop through to find the line of the Transmitter and write the updated line to the new file
    for line in file_content:
        if "#hertzian_dipole" in line:
            new_output = replaceTx(Tx, Ty, Tz, line)
            updated_file.append(new_output)
        elif "#rx" in line:
            new_output = replaceRx(Rx, Ry, Rz, line)
            updated_file.append(new_output)
        else:
            updated_file.append(line)
    file.close()
    
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

