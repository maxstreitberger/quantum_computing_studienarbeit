#!/bin/bash
if [ -f currents-loca.dat ]; then
    rm currents-loca.dat
fi

if [ "$1" == "-nlp" ]; then
    charonInterpreter.py -i nanowire_v1.nlp.inp --run
elif [ "$1" == "-iv" ]; then
    charonInterpreter.py -i nanowire_v1.iv.inp --run
    python3 plot_data.py
else
    charonInterpreter.py -i nanowire_v1.nlp.inp --run
    charonInterpreter.py -i nanowire_v1.iv.inp --run
    python3 plot_data.py
fi