import getopt
from gpr_updater import * 

file_path = sys.argv[1]   # Path to .in file
Transmitter = sys.argv[2] # Transmitter coordinates in form x, y, z as "0 0 0"
Receiver = sys.argv[3]    # Receiver coordinates in form x, y, z as "0 0 0"

Tx = Transmitter.split()
Rx = Receiver.split()

updateTRx(file_path, Tx[0], Tx[1], Tx[2], Rx[0], Rx[1], Rx[2]) 


