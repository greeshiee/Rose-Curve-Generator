#import libraries and functions
import numpy as np
import matplotlib.pyplot as plt
import subprocess
from generator import generate_verilog_file


#get user input
petals = float(input("Enter the number of petals: "))
period = int(input("Enter the number of pi periods: "))
color = input("Enter the color: ")

#create testbench
generate_verilog_file(petals, period)

#compile verilog
compile_command = f"iverilog -o sim *.v"
subprocess.run(compile_command, shell=True, check=True)

#run verilog
run_command = "vvp sim"
subprocess.run(run_command, shell=True, check=True)

plt.axes(projection='polar')

#open file and parse into numpy array
with open('data.txt', 'r') as file:
    lines = file.readlines()


arr = np.array([list(map(float, line.strip().split(','))) for line in lines])


# divide into r and theta
angles = arr[:, 1]
radii = arr[:, 0]

#plot info
plt.polar(angles, radii, color)
plt.show()











