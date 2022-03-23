require ('movement-functions')
require ('gprMaxInterface')

-- Use Shift + Click to select a robot
-- When a robot is selected, its variables appear in this editor
local experiment_path = "submissions/bisectional-scan.argos"
local output_folder = "submissions/bisectional-output"
local flag = false


-- Put your global variables here

local target = 1
local point_list = {{-4,-4},{4,-4},{4,-2},{-4,-2},{-4,0},{4,0},{4,2},{-4,2},{-4,4},{4,4},{4,-4},{2,-4},{2,4},{0,4},{0,-4},{-2,-4},{-2,4},{-4,4},{-4,-4}}
local current_target = point_list[target]
local table_length = tablelength(point_list)
local current_x= robot.positioning.position.x
local current_y= robot.positioning.position.y
local displacement = 0

--[[ This function is executed every time you press the 'execute' button ]]
function init()
	target = 1
	current_target = point_list[target]
   gpr_init(experiment_path)
end


--[[ This function is executed at each time step
     It must contain the logic of your controller ]]
function step()
	--Navigation Logic
	current_x= robot.positioning.position.x
	current_y= robot.positioning.position.y
	local sum_of_squares=math.pow((current_target[1] - current_x),2)+math.pow((current_target[2] - current_y),2)
	local traj_magnitude=math.sqrt(sum_of_squares)

	if (traj_magnitude > 0.1) then
		local isTurning = driveTo(current_target[1],current_target[2], 5)
	else
		if target + 1 > table_length then
			log("All Points Passed Through")
			driveForward(0)
		else
			target = target+1
			current_target = point_list[target]
		end
	end

	--GPR Logic 
	if displacement >= 1 then 
		displacement = 0
		local sensors = getSensorPos(0.01)
		gpr_step(sensor[1], sensor[2])
	elseif isTurning then
		displacement = 0
	else
		displacement = displacement + (math.pow((robot.positioning.position.x - current_x),2)+math.pow((robot.positioning.position.y - current_y),2))
	end
end



--[[ This function is executed every time you press the 'reset'
     button in the GUI. It is supposed to restore the state
     of the controller to whatever it was right after init() was
     called. The state of sensors and actuators is reset
     automatically by ARGoS. ]]
function reset()
	init()
   -- put your code here
end



--[[ This function is executed only once, when the robot is removed
     from the simulation ]]
function destroy()
   -- put your code here
end
