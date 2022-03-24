local sh = require ('sh')

local python_extractor = 'booth/Extractor1.py'
local gpr_updater = 'booth/gprUpdater.py'
local in_generator = 'booth/gprInit.py'

local python = sh.command('python')
local launch_gprmax = sh.command('python', '-m', 'gprMax')
local start_conda = sh.command('conda', 'activate')
local file_counter = 0
local mkdir = sh.command('mkdir')

function gpr_init(argos_exp_path, output_folder)
  file_counter = 0
  --Copy file over to the booth
  cp(argos_exp_path,"booth/current-sim.argos")
  log(output_folder)
  --make output directory
  mkdir(output_folder)
  
  --Launch python script to generate the gprMax ".in" file
  python(in_generator, "booth/current-sim.argos")
  
  --python("booth/launchgpr.py","booth/current-sim.in")
  
 
end

function gpr_step(Tx, Rx, output_folder)
  --Convert coordinates to form "1 1 1" for the python conversion
  transmitter_string = '"' .. tostring(Tx[1]) .. " " .. tostring(Tx[2]) .. " " .. tostring(Tx[3])  ..'"'
  receiver_string = '"' .. tostring(Rx[1]) .. " " .. tostring(Rx[2]) .. " " .. tostring(Rx[3]).. '"'
  local output_path = output_folder .. "/" .. tostring(file_counter) .. ".in"
  cp("booth/current-sim.in", output_path)
  --Pass the calculated coordinates into the gprMax model
  python(gpr_updater, "booth/current-sim.in", transmitter_string, receiver_string)
 
  --Run the gpr model
  --python("booth/launchgpr.py","booth/current-sim.in")

  --Create a new directory to put the results into
  file_counter = file_counter + 1
  
  
  --Copy Results to results folder
  --cp("booth/current-sim.out", output_path)
end

function gpr_initShot(argos_exp_path, output_folder)
  --Copy file over to the booth
  cp(argos_exp_path,"booth/current-sim.argos")
  --make output directory
  mkdir(output_folder)
  
  --Launch python script to generate the gprMax ".in" file
  python(in_generator, "booth/current-sim.argos")
  local output_path = output_folder .. "/" .. tostring(file_counter) .. ".in"
  cp("booth/current-sim.in", output_path)
  --python("booth/launchgpr.py","booth/current-sim.in")
  
 
end

function gpr_reset()
  --Prompt user if they would like to save the gpr simulation results
  --On save:
    --Prompt user to provide a path
    --Move simulation results over to provided path
  --On non-save:
    --Delete gpr simulation results
end

function getSensorPos(d)
  local dir = getYaw()
  -- Convert direction from degrees to radians
  dir = dir*0.01745329252
  -- Transmitter coordinates
  local transX = (robot.positioning.position.x + d*math.cos(dir))
  local transY = (robot.positioning.position.y + d*math.sin(dir))
  local transZ = robot.positioning.position.z

  -- Receiver coordinates
  local recX = (robot.positioning.position.x - d*math.cos(dir))
  local recY = (robot.positioning.position.y - d*math.sin(dir))
  local recZ = robot.positioning.position.z
  local tx = {transX, transY, transZ}
  local rx = {recX, recY, recZ}
  return {tx, rx}
end

