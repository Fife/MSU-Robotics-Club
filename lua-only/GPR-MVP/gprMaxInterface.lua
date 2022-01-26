local sh = require ('sh')

local python_extractor = 'Extractor1.py'

local python = sh.command('python')

function gpr_init(argos_exp_path)
  --Launch python script to generate the gprMax ".in" file
  python(python_extractor, (argos_exp_path))
  
  local launch_gprmax = sh.command('python', '-m', 'gprMax')
end

