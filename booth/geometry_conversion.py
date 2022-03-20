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


def cylinder_matrix(height, origin, rotation):
    """
    Return the rotation matrix associated with counterclockwise rotation about
    the given axis by theta radians.
    """
    
    if height < 0:
        #Origin is top:
        top = origin
        bottom = [origin[0], origin[1], origin[2]-height]
    else:
        #Origin is bottom:
        bottom = origin
        top = [origin[0], origin[1], origin[2]+height]
    
    #Find center for offsetting
    center = [(top[0]+bottom[0])/2,
              (top[1]+bottom[1])/2,
              (top[2]+bottom[2])/2]
    
    #Normalize points
    normalized_top = offsetCorrect(top, center)
    normalized_bottom = offsetCorrect(bottom, center)
    
    #Rotate
    rot_norm_top = rotate_zyx(normalized_top, rotation)
    rot_norm_bottom = rotate_zyx(normalized_top, rotation)
    
    
    #Re-Apply Offset
    bottom_out = addOffset(center, rot_norm_bottom)
    top_out = addOffset(center, rot_norm_top)
    return(bottom, top)

def rotate_x(point, angle):
    theta = np.radians(angle)
    c, s = np.cos(theta), np.sin(theta)
    rot= np.array([[1, 0, 0],
                   [0, c,-s],
                   [0, s, c]])
    nump_point = np.array([point[0], point[1], point[2]])
    return np.matmul(rot, nump_point).tolist()
    
def rotate_y(point, angle):
    theta = np.radians(angle)
    c, s = np.cos(theta), np.sin(theta)
    rot = np.array([[c, 0, s],
                    [0, 1, 0],
                    [-s, 0, c]])
    nump_point = np.array([point[0], point[1], point[2]])
    
    return np.matmul(rot, nump_point).tolist()
    
def rotate_z(point, angle):
    theta = np.radians(angle)
    c, s = np.cos(theta), np.sin(theta)
    rot = np.array([[c,-s, 0],
                    [s, c, 0],
                    [0, 0, 1]])
    nump_point = np.array([point[0], point[1], point[2]])
    
    return np.matmul(rot, nump_point).tolist()

def rotate_zyx(point, angle):
    point = rotate_z(point, angle[0])
    point = rotate_y(point, angle[1])
    point = rotate_x(point, angle[2])
    return point
    
def calculateSubBox(size, center):
    bl=[(center[0]-(size[0]/2)),(center[1]-(size[1]/2)),(center[2]-(size[2]/2))]
    tr=[(center[0]+(size[0]/2)),(center[1]+(size[1]/2)),0]
    return(bl, tr)
    
def offsetCorrect(point, offset):
    return [point[0]-offset[0],point[1]-offset[1],point[2]-offset[2]]
    
def addOffset(point, offset):
    return [point[0]+offset[0],point[1]+offset[1],point[2]+offset[2]]
	
