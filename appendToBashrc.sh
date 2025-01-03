#!/bin/bash

BASHRC="$HOME/.bashrc"

# Define commands to add to .bashrc
COMMANDS_TO_ADD=(
    'eval "$(starship init bash)"'
    'export BROWSER=wslview'
    'export PATH="$PATH:/opt/nvim-linux64/bin'
)

# Loop over each command in the array and add it to .bashrc if not already present
for COMMAND in "${COMMANDS_TO_ADD[@]}"; do
    if ! grep -q "$COMMAND" "$BASHRC"; then
        # Append to the end of .bashrc
        echo "$COMMAND" >> "$BASHRC"
        echo "'$COMMAND' added to the end of .bashrc."
    else
        echo "'$COMMAND' is already in .bashrc."
    fi
done
