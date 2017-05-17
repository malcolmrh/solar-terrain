#!/bin/bash
source activate solar-terrain-env
if [ $? -eq 0 ]; then
    :
else
# Create the environment and activate
    echo "Conda env 'solar-terrain-env' doesn't exist."
    conda env create -q
    source activate solar-terrain-env
fi

jupyter notebook
