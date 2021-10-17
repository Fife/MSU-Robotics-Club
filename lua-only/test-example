-- Use Shift + Click to select a robot
-- When a robot is selected, its variables appear in this editor

-- Use Ctrl + Click (Cmd + Click on Mac) to move a selected robot to a different location



-- Put your global variables here
local r = 0
local g= 0
local b = 0


--[[ This function is executed every time you press the 'execute' button ]]
function init()
   -- put your code here
	robot.wheels.set_velocity(20,0)
end



--[[ This function is executed at each time step
     It must contain the logic of your controller ]]
function step()
	r = robot.random.uniform_int(0,255)
	g = robot.random.uniform_int(0,255)
	b = robot.random.uniform_int(0,255)
	if var == false then 
		robot.leds.set_all_colors(r,g,b)
   else
		robot.leds.set_all_colors(0,0,0)
	end
	if var == true then
		var = false
	else
		var = true
	end
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
