function driveForward()
    robot.joints.base_wheel_bl.set_target(velocity)
    robot.joints.base_wheel_fl.set_target(velocity)
    robot.joints.base_wheel_br.set_target(-velocity)
    robot.joints.base_wheel_fr.set_target(-velocity)
end

function turnLeft()
    robot.joints.base_wheel_bl.set_target(0)
    robot.joints.base_wheel_fl.set_target(0)
    robot.joints.base_wheel_br.set_target(-velocity)
    robot.joints.base_wheel_fr.set_target(-velocity)
end

function turnRight()
    robot.joints.base_wheel_bl.set_target(velocity)
    robot.joints.base_wheel_fl.set_target(velocity)
    robot.joints.base_wheel_br.set_target(0)
    robot.joints.base_wheel_fr.set_target(0)
end

function reverse(velocity)
    robot.joints.base_wheel_bl.set_target(-velocity)
    robot.joints.base_wheel_fl.set_target(-velocity)
    robot.joints.base_wheel_br.set_target(velocity)
    robot.joints.base_wheel_fr.set_target(velocity)
end

function driveTo(x,y, forward_velocity)
	--get x and y of robot
	current_x= robot.positioning.position.x
	current_y= robot.positioning.position.y
	
	--create cartesian trajectory vector table
	traj_vector_cart = {x - current_x, y - current_y}
	
	--calculate magnitude of trajectory
	sum_of_squares=math.pow(traj_vector_cart[1],2)+math.pow(traj_vector_cart[2],2)
	traj_magnitude=math.sqrt((sum_of_sqaures))	

	--convert quarternion to z rotation
	current_angle=math.asin(robot.positioning.orientation.z)*2
	
	--create cartesian face vector 
	face_vector_cart = {math.cos(current_angle), math.sin(current_angle)}
	
	--Cross product of trajectory vector with face direction vector
	--Shortcut for 2d vectors since theres no cross product function.
	--T x F <-- Order is important
	cross_p = (traj_vector_cart[1]*face_vector_cart[2])-(face_vector_cart[1]*traj_vector_cart[2])
	
	--Angle between them is inverse cosine of the dot product T and F divided by the manitude of Trajectory vector.
	--acos(F*T/|T|)
	--This angle will always be between 0-180
	dot_p = face_vector_cart[1]*traj_vector_cart[1] + face_vector_cart[2]*traj_vector_cart[2]
	a = math.acos(dot_p/traj_magnitude)
	
	
	--If the result is negative, Turn Left. Otherwise turn Right. We can use the angle to determine how much we need to turn.
	speed_ratio = 7 *(a/180)
	if cross_p < 0 then
		turnLeft(speed_ratio)
	
	elseif cross_p > 0 then 
		turnRight(speed_ratio)
	
	else
		driveForward(forward_velocity)
	
	end
end