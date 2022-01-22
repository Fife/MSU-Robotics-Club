require movement-functions

function init()
    reset()
end

function step()
    driveTo(0.25,0.25,3)
end

function reset()
    driveForward(0)
end

function destroy() 

end
