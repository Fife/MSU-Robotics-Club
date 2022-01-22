function driveForward()
    robot.joints.base_wheel_bl.set_target(1)
    robot.joints.base_wheel_fl.set_target(1)
    robot.joints.base_wheel_br.set_target(-1)
    robot.joints.base_wheel_fr.set_target(-1)
end

function turnLeft()
    robot.joints.base_wheel_bl.set_target(0)
    robot.joints.base_wheel_fl.set_target(0)
    robot.joints.base_wheel_br.set_target(-1)
    robot.joints.base_wheel_fr.set_target(-1)
end

function turnRight()
    robot.joints.base_wheel_bl.set_target(1)
    robot.joints.base_wheel_fl.set_target(1)
    robot.joints.base_wheel_br.set_target(0)
    robot.joints.base_wheel_fr.set_target(0)
end
