**Metropolitain State University Denver Robotics Club NASA Minds 2022 Repository**

To support the mission of creating the first long-term presence on the Moon, this paper will investigate the possibilities of autonomous lunar discovery 
by simulating lunar resource discovery via homogenous robotic swarm. To fulfill this goal, the MSU Denver Robotics Club will be building a programming 
interface between ARGoS, a robotic swarm simulation program, and gprMax, a Ground Penetrating Radar (GPR) simulation program. After the programming 
interface between the simulation programs is complete, three simulations will be created to prove the goals of this project: (1) to prove that the 
interface between the programs is possible and (2) to demonstrate the increased  efficiency of using a  swarm to perform GPR mapping. This project will 
allow future researchers to create more advanced robotic swarm simulations involving GPR.

**Dependancies:**

gprMax:
https://github.com/gprmax/gprMax

ARGoS:
https://www.argos-sim.info/core.php

To run experiments in volving gpr:

1) Activate the gpr max environment with the command
<code>
    conda activate gprMax
</code>

2) Run experiment with the command
<code>
  argos3 -c submissions/bisectional-scan.argos
</code>

3) When the experiment loads, open the lua script associated with the experiement, for the above example find "bisectional-scan.lua"

4) Upload the lua script to the simulation window by pressing the gear buttong

5) Press the play button in the simulation window to start the simulation
