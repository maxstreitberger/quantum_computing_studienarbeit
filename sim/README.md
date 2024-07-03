# Studienarbeit in Quantum Computing Hardware

## Install
The installation can be done via Anaconda or a Python Virtual Environment. For my setup, I used the latter. For instructions on installing devsim with Anaconda, please refer to the installation guide on the [devsim GitHub page](https://github.com/devsim/devsim/blob/main/INSTALL.md).

1. Create a new Python Virtual Environment: `python3 -m venv ./venv`
2. Activate Virtual Environment: `source ./venv/bin/activate`
3. Install required packages:
```
pip install mkl numpy devsim pyvista panel wurlitzer
```
### Basic Test
You should now be able to run an example in the testing directory.
```
cd venv/devsim_data/testing
python3 cap2.py
```


## Run Charon simulation
```
charonInterpreter.py -i qubit_v1.nlp.inp --run
charonInterpreter.py -i qubit_v1.iv.inp --run
python3 plot_data.py
```