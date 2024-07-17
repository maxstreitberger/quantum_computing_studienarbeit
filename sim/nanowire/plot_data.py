import matplotlib.pyplot as plt
import numpy as np
import os

data = np.loadtxt('currents-loca.dat', skiprows=1)

source_Voltage = data[:, 0]
drain_current = data[:, 2]

plt.figure(figsize=(12, 7))
plt.plot(source_Voltage, drain_current, marker='x', linestyle='-', color='blue')
plt.title('Voltage vs Current (Log Scale)')
plt.xlabel('Voltage')
plt.ylabel('Current')
plt.grid(True, which="both", ls="--")

if not os.path.exists('./results'):
    os.makedirs('./results')

count = 1
while os.path.exists(f'./results/simulation_{count}.png'):
    count += 1
plt.savefig(f'./results/simulation_{count}.png')

