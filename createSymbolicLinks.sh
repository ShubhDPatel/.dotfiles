#!/bin/bash

# Function to create symlink for .inputrc
create_inputrc_symlink() {
  local SOURCE="$HOME/.dotfiles/.inputrc"
  local DESTINATION="$HOME/.inputrc"

  if [ -e "$DESTINATION" ]; then
    echo "Error: $DESTINATION already exists. Remove it first if you want to recreate the symlink."
  else
    ln -s "$SOURCE" "$DESTINATION"

    if [ -L "$DESTINATION" ]; then
      echo "Symbolic link created for .inputrc: $DESTINATION -> $SOURCE"
    else
      echo "Failed to create symbolic link for .inputrc."
    fi
  fi
}

# Function to create symlink for Neovim configuration
create_neovim_symlink() {
  local SOURCE_NVIM="$HOME/.dotfiles/nvim"
  local DESTINATION_NVIM="$HOME/.config/nvim"

  if [ -e "$DESTINATION_NVIM" ]; then
    echo "Error: $DESTINATION_NVIM already exists. Remove it first if you want to recreate the symlink."
  else
    ln -s "$SOURCE_NVIM" "$DESTINATION_NVIM"

    if [ -L "$DESTINATION_NVIM" ]; then
      echo "Symbolic link created for nvim: $DESTINATION_NVIM -> $SOURCE_NVIM"
    else
      echo "Failed to create symbolic link for nvim."
    fi
  fi
}

# Function to create symlink for starship.toml
create_starship_symlink() {
  local SOURCE_STARSHIP="$HOME/.dotfiles/starship.toml"
  local DESTINATION_STARSHIP="$HOME/.config/starship.toml"

  if [ -e "$DESTINATION_STARSHIP" ]; then
    echo "Error: $DESTINATION_STARSHIP already exists. Remove it first if you want to recreate the symlink."
  else
    ln -s "$SOURCE_STARSHIP" "$DESTINATION_STARSHIP"

    if [ -L "$DESTINATION_STARSHIP" ]; then
      echo "Symbolic link created for starship.toml: $DESTINATION_STARSHIP -> $SOURCE_STARSHIP"
    else
      echo "Failed to create symbolic link for starship.toml."
    fi
  fi
}

# Execute functions
create_inputrc_symlink
create_neovim_symlink
create_starship_symlink
