function stopMovement()
	 robot.joints.bleel.set_target(0)
    robot.joints.fleel.set_target(0)
    robot.joints.breel.set_target(0)
    robot.joints.freel.set_target(0)
end

function driveForward(velocity)
    robot.joints.bleel.set_target(velocity)
    robot.joints.fleel.set_target(velocity)
    robot.joints.breel.set_target(0-velocity)
    robot.joints.freel.set_target(0-velocity)
end

function turnLeft(velocity)
    robot.joints.bleel.set_target(0-velocity)
    robot.joints.fleel.set_target(0-velocity)
    robot.joints.breel.set_target(0-velocity)
    robot.joints.freel.set_target(0-velocity)
end

function turnRight(velocity)
    robot.joints.bleel.set_target(velocity)
    robot.joints.fleel.set_target(velocity)
    robot.joints.breel.set_target(velocity)
    robot.joints.freel.set_target(velocity)
end

function reverse(velocity)
    robot.joints.base_wheel_bl.set_target(0-velocity)
    robot.joints.base_wheel_fl.set_target(0-velocity)
    robot.joints.base_wheel_br.set_target(velocity)
    robot.joints.base_wheel_fr.set_target(velocity)
end

function driveTo(x,y, forward_velocity)
	--get x and y of robot
	local current_x= robot.positioning.position.x
	local current_y= robot.positioning.position.y
	--create cartesian trajectory vector table


	local traj_vector_cart = {x - current_x, y - current_y}
	
	--calculate magnitude of trajectory
	local sum_of_squares=math.pow((x - current_x),2)+math.pow((y - current_y),2)

	local traj_magnitude=math.sqrt(sum_of_squares)	

	local w = robot.positioning.orientation.w
	local x = robot.positioning.orientation.x
	local y = robot.positioning.orientation.y
	local z = robot.positioning.orientation.z
	local t3 = 2*(w*z+x*y)
	local t4 = 1 - 2*(y*y+z*z)

	local yaw = math.atan(t3, t4)*(180/math.pi)
	if yaw<0 then
		yaw = yaw + 360
	end
	yaw = yaw * math.pi/180
	--convert quarternion to z rotation
	local current_angle= yaw

	--create cartesian face vector 

	local face_vector_cart = {math.cos(current_angle), math.sin(current_angle)}
	
	--Cross product of trajectory vector with face direction vector
	--Shortcut for 2d vectors since theres no cross product function.
	--T x F <-- Order is important
	local cross_p = (traj_vector_cart[1]*face_vector_cart[2])-(face_vector_cart[1]*traj_vector_cart[2])
	
	--Angle between them is inverse cosine of the dot product T and F divided by the manitude of Trajectory vector.
	--acos(F*T/|T|)
	--This angle will always be between 0-180
	local dot_p = face_vector_cart[1]*traj_vector_cart[1] + face_vector_cart[2]*traj_vector_cart[2]
	local a = math.deg((math.acos(dot_p/traj_magnitude)))
	
	

	log("Angle between :" .. a)
	--log("Cross Product:" .. cross_p)
	log("Face Angle " .. current_angle)
	--If the result is negative, Turn Left. Otherwise turn Right. We can use the angle to determine how much we need to turn.
	local speed_ratio = 10 
	
	if cross_p < -0.02 then
		turnLeft(speed_ratio/2)
	
	elseif cross_p > 0.02 then 
		turnRight(speed_ratio/2)
	
	else
		if a < 0.5 then
				driveForward(forward_velocity)		
		end
	end
end