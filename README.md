# About this repository

The purpose of this repository is to keep track of the current working robotics experiments and ARGoS configurations of the MSU-Robotics Club. 
It also serves as a collaboration homebase for the software and hardware teams as projects expand beyond simulation. 
    
## High level Pseudocode 

Generate GPR Model from .argos file
Start ARGoS simulation environment
On simulation step:
    For each robot:
        Modify Tx and Rx locations in the GPR Model
        Perform GPR simulation
        Write GPR simulation
        Execute Movement Algorithm
On simulation Reset:
    Prompt removal of last GPR simulation results
     
## Quick Start with ARGoS 

The following steps assume that you have already installed ARGoS on your system as described here:
https://www.argos-sim.info/core.php

Note: If you are booting from the Live USB that you got from the club meeting, you do not need to install ARGoS! It comes pre-loaded on the USB. Follow the steps below to get the examples running on the Live USB stick. 

1. Download the repository and unpack it in a memorable directory. 

2. Navigate to the directory you unpacked the repository in: 

    $ cd /PATH/MSU-Robotics-Club

    (remember that "PATH" denotes the upper path of the file's location....dont actually type "PATH")

3. Create a new directory and name it "build"

    $ mkdir build

4.  Navigate to the new directory: 

    $ cd build

5. Call cmake to get the files ready for compilation. You have 2 options:

    $ cmake -DCMAKE_BUILD_TYPE=Release ..  

    or

    $ cmake -DCMAKE_BUILD_TYPE=Debug ..

6. Make the configuration:

    $ make

7. If you get no errors then you can navigate back up to the MSU-Robotics-Club directory to launch ARGoS.
    
    $ cd ..
    
    If you want to launch ARGoS with the Lua editor you can type:

    $ argos3 -c lua-only/expSetup.argos

    If you want to lanch an experiment on its own without the editor, you can type:

    $ argos3 -c experiments/custom_experiment.argos
    
    Note that "diffusion_1.argos" can be replaced with any .argos file that has been included and compiled in the directory. 

There is also a script in the MSU-Robotics-Club directory that can be used to launch argos with the lua editor in a default prohject. It can be accessed by typing

   $ ./start-argos.sh

   while in the MSU-Robotics Club directory. 

