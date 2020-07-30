#!/usr/bin/env bash

# Download the Microsoft repository GPG keys
wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb

# Register the Microsoft repository GPG keys
sudo dpkg -i packages-microsoft-prod.deb && sudo apt-get update

# Update the list of products
# RUN sudo apt-get update

# Enable the "universe" repositories
# RUN sudo add-apt-repository universe

# Install PowerShell
echo "initiating installation of powershell"
sudo apt-get install -y powershell