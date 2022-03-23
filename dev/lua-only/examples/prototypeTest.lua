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
    robot.joints.base_wheel_bl.set_target(-1)
    robot.joints.base_wheel_fl.set_target(1)
    robot.joints.base_wheel_br.set_target(-1)
    robot.joints.base_wheel_fr.set_target(1)
end

function destroy() end
