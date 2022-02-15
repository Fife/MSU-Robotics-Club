import os
import getopt, sys, subprocess

experiment_path = sys.argv[1]

subprocess.run(["python", "-m", "gprMax",experiment_path], capture_output=False)
subprocess.run(["echo", "Did my thing"])
