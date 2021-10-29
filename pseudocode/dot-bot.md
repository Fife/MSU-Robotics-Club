Here's where the pseudocode for the dot bot goes!

For the first iteration of the our robot swarm, we want the swarm to be able to converge over dark spots.

This algorithm is loosely broken up into three main functions:

    1. Spread out over a location
    2. Locate a potential spot
    3. Converge at the location 

Of course, each of these functions are also algorithms, so it will be good practice to try and flesh out each algorithm independently.

Here is where we will work on the pseudocode for the first iteration of the simulation. 

Spreading out:

    1. Align the swarm starting point.
        -Distribute swarm along arclength of the diagonal of the homebase 
    2. Spread out untill:
        -The average arc length of the nodes is greater than some arbitrary threshold
        or
        -Resource deposit is located
    3. Regroup and Redistribute based on the conditions in Step 2


Bot Setup Pseudo code

    1. Declare size of swarm
    2. Spawn in home
    3. Calculate x&y coordinates
    4. Assign starting points to swarm
    5. move swarm to starting points
    6. Send ready message

FORMULA FOR COORDINATES

X=cos(n/numbots*Π/2)

Y=sin(n/numbots*Π/2)


FORMULA FOR ANGLES

θ= 90/1+n = Angle between each bot

































































































