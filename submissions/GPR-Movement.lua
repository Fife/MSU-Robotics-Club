require ('movement-functions')

local target = 1
local point_list = {{}}
local current_target = point_list[target]
local table_length = 

function init()
    reset()
end

function step()
	if robot.positioning.position.x < 0.25 and robot.positioning.position.y < 0.25 then
		driveTo(0.25,0.25, 5)
	else 
		stopMovement()
	end
end

function reset()
    driveForward(0)
end

function destroy() 

end
