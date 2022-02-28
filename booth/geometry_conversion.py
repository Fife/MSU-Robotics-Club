#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Jan 31 17:02:44 2022

This function takes in 2 parameters:
-x, y, z lengths of a box
-center coordinate of the box

Function returns the bottom left and top right coordinates of a box.

Copyright (C) 2022 MSU Denver Robotics Club, Victor Lemus <vlemusgo@msudenver.edu> 
"""
import math

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

