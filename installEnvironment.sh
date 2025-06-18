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

install_neovim() {
    echo "Checking if Neovim is already installed..."
    if command -v nvim &> /dev/null; then
        echo "Neovim is already installed. Skipping installation."
    else
        echo "Installing Neovim..."
        curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
        sudo rm -rf /opt/nvim-linux-x86_64
        sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
        echo "Neovim installation completed."
    fi
}

install_starship
install_neovim
