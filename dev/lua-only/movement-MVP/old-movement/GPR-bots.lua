
-- Use Shift + Click to select a robot
-- When a robot is selected, its variables appear in this editor

-- Use Ctrl + Click (Cmd + Click on Mac) to move a selected robot to a different location

-- Put your global variables here

x_acc = 0;
y_acc = 0;
last_x = 0; 
last_y = 0;
side_length = 1.0;
trace_width = 0.5;

function turnLeft(speed)
	robot.wheels.set_velocity(0, speed)
end

function turnRight(speed)
	robot.wheels.set_velocity(speed, 0)
end

--[[ This function is executed every time you press the 'execute' button ]]
function init()
   -- put your code here
	robot.wheels.set_velocity(20,20)
	last_x = robot.positioning.position.x;
	last_y = robot.positioning.position.y;
end



--[[ This function is executed at each time step
     It must contain the logic of your controller ]]
function step()
	local delta_x, delta_y = 0, 0;
	delta_x = robot.positioning.position.x - last_x;
	delta_y = robot.positioning.position.y - last_y;

	log("x accumulator:" .. x_acc )
	
	
	log("zrot" .. math.deg(math.asin(robot.positioning.orientation.z)*2))
	last_x = robot.positioning.position.x;
	last_y = robot.positioning.position.y;
	x_acc = x_acc + delta_x;
	y_acc = y_acc + delta_y;
	
	if x_acc > 1.0 then
		--I do not know why, but it appears that 0.7 is equal to 90 degrees
		if robot.positioning.orientation.z < .70 then
			turnLeft(10)
		else
			robot.wheels.set_velocity(20,20)
		end
	end 

	if y_acc > trace_width then
		--I do not know why, but it appears that 0.9998 is equal to 180 degrees around
		if robot.positioning.orientation.z < .9998 then
			turnLeft(5)
		else
			robot.wheels.set_velocity(20,20)
		end
	end 

	if x_acc < 0 then
		--I do not know why, but it appears that 0.7 is equal to 90 degrees
		if robot.positioning.orientation.z > 0.7 then
			turnRight(5)
		else
			robot.wheels.set_velocity(20,20)
		end
	end 
	
	if y_acc > trace_width*2 then
		--I do not know why, but it appears that 0.9998 is equal to 180 degrees around
		if robot.positioning.orientation.z > 0 then
			turnRight(5)
		else
			robot.wheels.set_velocity(20,20)
		end
	end 

		
end



--[[ This function is executed every time you press the 'reset'
     button in the GUI. It is supposed to restore the state
     of the controller to whatever it was right after init() was
     called. The state of sensors and actuators is reset
     automatically by ARGoS. ]]
function reset()
   -- put your code here
	delta_x= 0;
	delta_y = 0;
	x_acc = 0;
	y_acc = 0;
	last_x = robot.positioning.position.x;
	last_y = robot.positioning.position.y;
	robot.wheels.set_velocity(20,20)
end




--[[ This function is executed only once, when the robot is removed
     from the simulation ]]
function destroy()
   -- put your code here
end




