-- Use Shift + Click to select a robot
-- When a robot is selected, its variables appear in this editor

local flag = false

-- Use Ctrl + Click (Cmd + Click on Mac) to move a selected robot to a different location
function driveTo(x,y)
	--get x and y of robot
	local current_x= robot.positioning.position.x
	local current_y= robot.positioning.position.y
	--create cartesian trajectory vector table


	local traj_vector_cart = {x - current_x, y - current_y}
	
	--calculate magnitude of trajectory
	local sum_of_squares=math.pow((x - current_x),2)+math.pow((y - current_y),2)

	local traj_magnitude=math.sqrt(sum_of_squares)	

	--convert quarternion to z rotation
	local current_angle=math.asin(robot.positioning.orientation.z)*2

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
	log("Cross Product:" .. cross_p)
	log("Face Angle " .. math.deg(current_angle))
	--If the result is negative, Turn Left. Otherwise turn Right. We can use the angle to determine how much we need to turn.
	local speed_ratio = 10 
	
	if cross_p < -0.005 then
		turnLeft(speed_ratio/2)
	
	elseif cross_p > 0.005 then 
		turnRight(speed_ratio/2)
	
	elseif cross_p < 0.005 and cross_p > -0.005 then
		if a < 2 then
				robot.wheels.set_velocity(speed_ratio*2, speed_ratio*2)			
		end
	end
end

function turnLeft(speed)
	robot.wheels.set_velocity(0, speed)
end

function turnRight(speed)
	robot.wheels.set_velocity(speed, 0)
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

-- Put your global variables here

local target = 1
local point_list = {{0.5,-0.5},{0.5,0},{-0.5,0},{-0.5,0.5},{0.5,0.5},{0.5,-0.5},{0,-0.5},{0,0.5},{-0.5,0.5}, -0.5,-0.5}
local current_target = point_list[target]
local table_length = tablelength(point_list)


--[[ This function is executed every time you press the 'execute' button ]]
function init()
   -- put your code here

	log("Current Target X :".. current_target[1])
	log("Current Target Y :".. current_target[2])
	
	robot.wheels.set_velocity(5,5)
end


--[[ This function is executed at each time step
     It must contain the logic of your controller ]]
function step()
	local current_x= robot.positioning.position.x
	local current_y= robot.positioning.position.y
	local sum_of_squares=math.pow((current_target[1] - current_x),2)				              +math.pow((current_target[2] - current_y),2)

	local traj_magnitude=math.sqrt(sum_of_squares)
	if (traj_magnitude > .125) then
		driveTo(current_target[1],current_target[2])
	else
		if target + 1 > table_length then
			log("All Points Passed Through")
			robot.leds.set_all_colors(0,255,0)
			robot.wheels.set_velocity(0,0)
		else
			target = target+1
			current_target = point_list[target]
			log("Position Changed X :".. current_x)
			log("Position Changed Y :".. current_y)
			log("Current Target X :".. current_target[1])
			log("Current Target Y :".. current_target[2])
		end
	end
   -- put your code here
end



--[[ This function is executed every time you press the 'reset'
     button in the GUI. It is supposed to restore the state
     of the controller to whatever it was right after init() was
     called. The state of sensors and actuators is reset
     automatically by ARGoS. ]]
function reset()
	target = 1
	current_target = point_list[target]

   -- put your code here
end



--[[ This function is executed only once, when the robot is removed
     from the simulation ]]
function destroy()
   -- put your code here
end
