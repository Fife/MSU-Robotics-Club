require ('movement-functions')

-- Use Shift + Click to select a robot
-- When a robot is selected, its variables appear in this editor

local flag = false

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

-- Put your global variables here

local target = 1
local point_list = {{4,-4},{4,0},{-4,0},{-4,4},{4,4},{4,-4},{0,-4},{0,4},{-4,4}, {-4,-4}}
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
