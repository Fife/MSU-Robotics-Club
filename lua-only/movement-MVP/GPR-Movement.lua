require movement-functions

function init()
    reset()
end

function step()
    log("wheelvelocities:"..
    string.format("%.2f", robot.joints.base_wheel_bl.encoder) ..","..
    string.format("%.2f", robot.joints.base_wheel_fl.encoder) ..","..
    string.format("%.2f", robot.joints.base_wheel_br.encoder) ..","..
    string.format("%.2f", robot.joints.base_wheel_fr.encoder))
end

function reset()
    driveForward()
end

function destroy() 

end
