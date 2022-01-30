function getSensorPos(x, y, d, dir)
    local transX = (x + d*math.cos(dir))
    local transY = (y + d*math.sin(dir))

    local recX = (x - d*math.cos(dir))
    local recY = (y - d*math.sin(dir))
    
    return transX, transY, recX, recY
end
