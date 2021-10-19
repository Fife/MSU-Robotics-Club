# Quick Start 

## First Time Setup

1. Download the repository and unpack it in a memorable directory. 

2. Navigate to the directory you unpacked the repository in: 

    $ cd /PATH/MSU-Robotics-Club

    (remember that "PATH" denotes the upper path of your file structure....dont actually type "PATH")

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
    
    If you want to launch ARGoS with the Lua editor you can type:

    $ argos3 -c lua-only/expSetup.argos

    If you want to lanch an experiment on its own without the editor, you can type:

    $ argos3 -c experiments/diffusion_1.argos
