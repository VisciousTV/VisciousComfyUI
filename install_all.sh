#!/usr/bin/env bash
set -e
source ~/miniconda3_custom/etc/profile.d/conda.sh   # or your venv activate
conda activate comfy     # or `source venv/bin/activate`

# core project
if [ -f "constraints.txt" ]; then
    pip install --upgrade -r requirements.txt -c constraints.txt
else
    pip install --upgrade -r requirements.txt
fi

# every custom node
for req in $(find custom_nodes -name requirements.txt); do
    if [ -f "constraints.txt" ]; then
        pip install --upgrade -r "$req" -c constraints.txt
    else
        pip install --upgrade -r "$req"
    fi
done
