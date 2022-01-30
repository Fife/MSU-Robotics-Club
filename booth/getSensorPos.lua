-- Takes rover's coordinates 'x,y' the distance of the sensors from
-- the center of the rover 'd' and rover's direction in degrees 'dir'
-- Returns the coordinates of the transmitter and the receiver.
function getSensorPos(x, y, d, dir)
    -- Convert orientation from degrees to radians
    dir = dir*0.01745329252;
    
    -- Transmitter coordinates
    local transX = (x + d*math.cos(dir))
    local transY = (y + d*math.sin(dir))

    -- Receiver coordinates
    local recX = (x - d*math.cos(dir))
    local recY = (y - d*math.sin(dir))
    
    return transX, transY, recX, recY
end
