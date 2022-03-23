require ('movement-functions')
-- Use Shift + Click to select a robot
-- When a robot is selected, its variables appear in this editor

-- Use Ctrl + Click (Cmd + Click on Mac) to move a selected robot to a different location


-- Put your global variables here



--[[ This function is executed every time you press the 'execute' button ]]
function init()
   -- put your code here
	turnLeft(5)
end



--[[ This function is executed at each time step
     It must contain the logic of your controller ]]
function step()
   -- put your code here
	local w = robot.positioning.orientation.w
	local x = robot.positioning.orientation.x
	local y = robot.positioning.orientation.y
	local z = robot.positioning.orientation.z
	local t3 = 2*(w*z+x*y)
	local t4 = 1 - 2*(y*y+z*z)

	local yaw = math.atan(t3, t4)*(180/math.pi)
	if yaw<0 then
		yaw = 360+yaw
	end
	log(yaw)


end



--[[ This function is executed every time you press the 'reset'
     button in the GUI. It is supposed to restore the state
     of the controller to whatever it was right after init() was
     called. The state of sensors and actuators is reset
     automatically by ARGoS. ]]
function reset()
   -- put your code here
end



--[[ This function is executed only once, when the robot is removed
     from the simulation ]]
function destroy()
   -- put your code here
end
