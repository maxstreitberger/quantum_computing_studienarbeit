import matplotlib.pyplot as plt
import numpy as np
import os

data = np.loadtxt('quantum_currents_v2_160.gate.dat', skiprows=1)

voltage = data[:, 0]
current = data[:, 5]

plt.figure(figsize=(12, 7))
plt.plot(voltage, current, marker='x', linestyle='-', color='blue')
plt.title('Voltage vs Current')
plt.xlabel('Voltage')
plt.ylabel('Current')
plt.grid(True, which="both", ls="--")

if not os.path.exists('./results'):
    os.makedirs('./results')

plt.savefig(f'./results/simulation_160.png')

