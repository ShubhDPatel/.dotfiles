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


# Define source and destination for nvim directory
SOURCE_NVIM="$HOME/.dotfiles/nvim"
DESTINATION_NVIM="$HOME/.config/nvim"

# Check if the nvim symlink destination already exists
if [ -e "$DESTINATION_NVIM" ]; then
    echo "Error: $DESTINATION_NVIM already exists. Remove it first if you want to recreate the symlink."
    exit 1
fi

# Create the symbolic link for nvim
ln -s "$SOURCE_NVIM" "$DESTINATION_NVIM"

# Verify the link creation for nvim
if [ -L "$DESTINATION_NVIM" ]; then
    echo "Symbolic link created: $DESTINATION_NVIM -> $SOURCE_NVIM"
else
    echo "Failed to create symbolic link for nvim."
    exit 1
fi
