-- Takes rover's x,y coordinates, the offset of the sensors from
-- the center of the rover d, and rover's direction in radians dir.
-- Returns the coordinates of the transmitter and the receiver.
function getSensorPos(x, y, d, dir)
    local transX = (x + d*math.cos(dir))
    local transY = (y + d*math.sin(dir))

    local recX = (x - d*math.cos(dir))
    local recY = (y - d*math.sin(dir))
    
    return transX, transY, recX, recY
end
