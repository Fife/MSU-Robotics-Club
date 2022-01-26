local sh = require ('sh')

local python_extractor = 'Extractor1.py'

local python = sh.command('python')
local launch_gprmax = sh.command('python', '-m', 'gprMax')

function gpr_init(argos_exp_path)
  --Launch python script to generate the gprMax ".in" file
  python(python_extractor, (argos_exp_path))
 
end

function gpr_step(x, y, z, zAngle)
  --Calculate the locations of the Tx and Rx node with the passed in coordinates
  --Pass the calculated coordinates into the gprMax model
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
