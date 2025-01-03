#!/bin/bash

SOURCE="$HOME/.dotfiles/.inputrc"
DESTINATION="$HOME/.inputrc"

# Check if the destination already exists
if [ -e "$DESTINATION" ]; then
    echo "Error: $DESTINATION already exists. Remove it first if you want to recreate the symlink."
    exit 1
fi

# Create the symbolic link
ln -s "$SOURCE" "$DESTINATION"

# Verify the link creation
if [ -L "$DESTINATION" ]; then
    echo "Symbolic link created: $DESTINATION -> $SOURCE"
else
    echo "Failed to create symbolic link."
    exit 1
fi

