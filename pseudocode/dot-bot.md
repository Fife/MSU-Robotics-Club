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
    3. Regroup and Redistribute or  