require ('movement-functions')
require ('mapping-functions')
require ('gprMaxInterface')

-- Use Shift + Click to select a robot
-- When a robot is selected, its variables appear in this editor
local flag = false


-- Put your global variables here

local target = 1
local point_list = {{-4,-4},{4,-4},{4,-2},{-4,-2},{-4,0},{4,0},{4,2},{-4,2},{-4,4},{4,4},{4,-4},{2,-4},{2,4},{0,4},{0,-4},{-2,-4},{-2,4},{-4,4},{-4,-4}}
local current_target = point_list[target]
local table_length = tablelength(point_list)
local current_x= robot.positioning.position.x
local current_y= robot.positioning.position.y
local last_x = current_x
local last_y = current_y
local disp = 0
local lastTurn = false
local isTurning = false
local field = chunk()

--[[ This function is executed every time you press the 'execute' button ]]
function init()
	target = 1
   current_target = point_list[target]
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
		isTurning = driveTo(current_target[1],current_target[2], 5)
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

	if disp >= 1 then 
		log("GPR Snapshot at " .. tostring(current_x) .. " " .. tostring(current_y) )
		disp = 0
		last_x = current_x
		last_y = current_y
		local sensors = getSensorPos(0.01)
		--gpr_step(sensors[1], sensors[2], output_folder)
	elseif (isTurning == true and lastTurn == true) then
		disp = 0
		last_x = current_x
		last_y = current_y
	else
		--log("Adding to Displacement")
		disp = (math.pow((robot.positioning.position.x - last_x),2)+  math.pow((robot.positioning.position.y - last_y),2))
	end
	lastTurn = isTurning
end
