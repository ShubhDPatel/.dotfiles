#!/bin/bash

install_starship() {
    echo "Checking if Starship is already installed..."
    if command -v starship &> /dev/null; then
        echo "Starship is already installed. Skipping installation."
    else
        echo "Installing Starship prompt manager..."
        if curl -sS https://starship.rs/install.sh | sh; then
            echo "Starship installation succeeded."
        else
            echo "Starship installation failed."
        fi
  fi
}

install_starship
