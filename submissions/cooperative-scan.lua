require ('movement-functions')
require ('mapping-functions')
require ('gprMaxInterface')

-- Use Shift + Click to select a robot
-- When a robot is selected, its variables appear in this editor
local flag = false


-- Put your global variables here

local target = 1
local current_target
local current_x= robot.positioning.position.x
local current_y= robot.positioning.position.y
local last_x = current_x
local last_y = current_y
local disp = 0
local lastTurn = false
local isTurning = false

local field = chunk(36,36,3, {0,0})

--[[ This function is executed every time you press the 'execute' button ]]
function init()
	target = 1
	if robot.id == "gpr-bot2" then
		current_path = generatePath(field[1]["bl"], 10, 2 ,2)
   	current_target = current_path[target]
	elseif robot.id == "gpr-bot1" then
		current_path = generatePath(field[2]["bl"], 10, 2 ,2)
   	current_target = current_path[target]
	elseif robot.id == "gpr-bot0" then
		current_path = generatePath(field[4]["bl"], 10, 2 ,2)
   	current_target = current_path[target]
	end
   log(robot.id)
	log(current_target[1])
	log(current_target[2])
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
		if target + 1 > tablelength(current_path) then
			log("All Points Passed Through")
			driveForward(0)
		else
			target = target+1
			current_target = current_path[target]
		end
	end
end
