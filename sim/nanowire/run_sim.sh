#!/bin/bash
if [ -f currents-loca.dat ]; then
    rm currents-loca.dat
fi

if [ "$1" == "-nlp" ]; then
    charonInterpreter.py -i nanowire_v1.nlp.inp --run
elif [ "$1" == "-iv" ]; then
    charonInterpreter.py -i nanowire_v1.iv.inp --run
    python3 plot_data.py
elif [ "$1" == "-sim" ]; then
    for ((X=5; X<=25; X+=5)); do
        echo "Running simulation. Gate_2 voltage at $X"
        charonInterpreter.py -i nanowire_v2.iv_${X}.inp --run
    done
else
    charonInterpreter.py -i nanowire_v1.nlp.inp --run
    charonInterpreter.py -i nanowire_v1.iv.inp --run
    python3 plot_data.py
fi