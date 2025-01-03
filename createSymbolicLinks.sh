#!/bin/bash

# Inputrc block
SOURCE="$HOME/.dotfiles/.inputrc"
DESTINATION="$HOME/.inputrc"

# Check if the .inputrc symlink destination already exists
if [ -e "$DESTINATION" ]; then
    echo "Error: $DESTINATION already exists. Remove it first if you want to recreate the symlink."
else
    # Create the symbolic link for .inputrc
    ln -s "$SOURCE" "$DESTINATION"

    # Verify the link creation for .inputrc
    if [ -L "$DESTINATION" ]; then
        echo "Symbolic link created for .inputrc: $DESTINATION -> $SOURCE"
    else
        echo "Failed to create symbolic link for .inputrc."
    fi
fi

# Neovim block
SOURCE_NVIM="$HOME/.dotfiles/nvim"
DESTINATION_NVIM="$HOME/.config/nvim"

# Check if the nvim symlink destination already exists
if [ -e "$DESTINATION_NVIM" ]; then
    echo "Error: $DESTINATION_NVIM already exists. Remove it first if you want to recreate the symlink."
else
    # Create the symbolic link for nvim
    ln -s "$SOURCE_NVIM" "$DESTINATION_NVIM"

    # Verify the link creation for nvim
    if [ -L "$DESTINATION_NVIM" ]; then
        echo "Symbolic link created for nvim: $DESTINATION_NVIM -> $SOURCE_NVIM"
    else
        echo "Failed to create symbolic link for nvim."
    fi
fi
