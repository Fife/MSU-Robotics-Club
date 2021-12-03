function driveTo(x,y)
	--get x and y of robot
	current_x= robot.positioning.position.x
	current_y= robot.positioning.position.y
	
		
	--calculate angle and magnitude of trajectory
	sum_of_squares=math.pow((x-current_x),2)+math.pow((y-current_y),2)
	magnitude=math.sqrt((sum_of_sqaures))	
	angle=math.asin((y-current_y)/magnitude)
	
	
	--convert quarternion to z rotation
	current_angle=math.deg(math.asin(robot.positioning.orientation.z)*2)
	
	--create unit vector for the face direction
	
	--Cross product of trajectory vector with face direction vector
	--T x F
	--If the result is negative, Turn Left. Otherwise turn Right.
	
	--Angle between them is inverse cosine of the dot product T and F divided by the manitude of Trajectory vector.
	--acos(F*T/|T|)*180/pi
	--This angle will always be between 0-180
end
