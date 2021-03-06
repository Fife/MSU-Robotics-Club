--[[
Takes rover's coordinates 'x,y,z' the distance of the sensors from
the center of the rover 'd' and rover's direction in degrees 'dir'
Returns the address of a table with the coordinates of the transmitter
and the receiver.
]]--
function getSensorPos(x, y, z, d, dir)
    -- Convert direction from degrees to radians
    dir = dir*0.01745329252;
    
    -- Transmitter coordinates
    local transX = (x + d*math.cos(dir))
    local transY = (y + d*math.sin(dir))
    local transZ = z

    -- Receiver coordinates
    local recX = (x - d*math.cos(dir))
    local recY = (y - d*math.sin(dir))
    local recZ = z
    
    return {transX, transY, transZ, recX, recY, recZ}
end
