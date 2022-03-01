#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Jan 31 17:02:44 2022

cube_matrix takes in 2 parameters:
- x, y, z lengths of a box
- center base origin coordinates of the box

cube_matrix returns the bottom left and top right coordinates of a box.

cylinder_matrix takes in 4 parameter:
- x, y, z lengths of a box
- center base origin coordinates of the box
- radius of cylinder
- height of cylinder

cylinder_matrix returns 

Copyright (C) 2022 MSU Denver Robotics Club, Victor Lemus <vlemusgo@msudenver.edu>

Various enhancements by Jacob Fifield.
(C) 2022 Jacob Fifield <jfifiel2@msudenver.edu>

"""
import math
import numpy as np

def cube_matrix(dimensions, origin):
    """
    Return the rotation matrix associated with counterclockwise rotation about
    the given axis by theta radians.
    """
    if dimensions[2] > 0:
        bl = [(origin[0] - (dimensions[0]/2)), (origin[1] - (dimensions[1]/2)), origin[2]]
        tr = [(origin[0] + (dimensions[0]/2)), (origin[1] + (dimensions[1]/2)), origin[2]+dimensions[2]]
    else:   
        bl = [(origin[0] - (dimensions[0]/2)), (origin[1] - (dimensions[1]/2)), origin[2]+dimensions[2]]
        tr = [(origin[0] + (dimensions[0]/2)), (origin[1] + (dimensions[1]/2)), origin[2]]
        
    return(bl, tr)


def cylinder_matrix(radius, height, dimensions, origin):
    """
    Return the rotation matrix associated with counterclockwise rotation about
    the given axis by theta radians.
    """
    center=[origin[0], origin[1], origin[2]+(height/2)]
    
    if height > 0:
        center=[origin[0], origin[1], origin[2]+(height/2)]
        bottom = [origin[0], origin[1], origin[2]]
        top = [origin[0], origin[1], origin[2]+height]
        rot = [bottom[0] - center[0], bottom[1]-center[1], bottom[2]-center[2]]
    else:
        bottom = [origin[0], origin[1], origin[2]+height]
        top = [origin[0], origin[1], origin[2]]
        rot =[top[0]-center[0], top[1]-center[1], top[2]-center[2]]
   
    return()
