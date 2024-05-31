import matplotlib.pyplot as plt
import numpy as np

data = np.loadtxt('currents-loca.dat', skiprows=1)

source_Voltage = data[:, 0]
drain_current = data[:, 2]

plt.figure(figsize=(12, 7))
plt.plot(source_Voltage, drain_current, marker='x', linestyle='-', color='blue')
plt.title('Voltage vs Current (Log Scale)')
plt.xlabel('Voltage')
plt.ylabel('Current')
plt.grid(True, which="both", ls="--")
plt.show()
