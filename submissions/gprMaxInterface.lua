local sh = require ('sh')

local python_extractor = 'booth/Extractor1.py'
local gpr_updater = 'booth/gprUpdater.py'
local in_generator = 'booth/gprInit.py'

local python = sh.command('python')
local launch_gprmax = sh.command('python', '-m', 'gprMax')
local start_conda = sh.command('conda', 'activate')

function gpr_init(argos_exp_path)
  --Copy file over to the booth
  cp(argos_exp_path,"booth/current-sim.argos")
  
  --Launch python script to generate the gprMax ".in" file
  python(in_generator, "booth/current-sim.argos")
  --Start Conda Environment
  
  python("booth/launchgpr.py","booth/current-sim.in")
  
 
end

function gpr_step(Tx, Rx)
  --Convert coordinates to form "1 1 1" for the python conversion
  transmitter_string = tostring(Tx[1]) .. " " .. tostring(Tx[2]) .. " " .. tostring(Tx[3])
  receiver_string = tostring(Rx[1]) .. " " .. tostring(Rx[2]) .. " " .. tostring(Rx[3])
  
  --Pass the calculated coordinates into the gprMax model
  python(gpr_updater, path, transmitter_string, receiver_string)
  --Create a new directory to put the results into
  --Run the simulation for that Tx and Rx position, write results in created directory
end

function gpr_reset()
  --Prompt user if they would like to save the gpr simulation results
  --On save:
    --Prompt user to provide a path
    --Move simulation results over to provided path
  --On non-save:
    --Delete gpr simulation results
end
