#!/usr/bin/env bash

source lib.sh

awesome_header

bot "Customized environment"

# bot "Copying settings.json"
# ln -sf ~/.vscode/settings.json /User/settings.json
# ln -sf ~/.vscode/keybindings.json /User/keybindings.json

# bot "installing git-town"
# sudo dpkg -i ../linux/app/git-town-amd64.deb

# bot "installing starship prompt"
# curl -fsSL https://starship.rs/install.sh | bash -s -- --force

bot "adding starship to default .bashrc"
echo "eval ""$(starship init bash)""" >> ~/.bashrc && source ~/.bashrc
bot "initializing"
starship init bash

apt install curl -y
echo "completed setup of starship.rs"

echo "installing fonts"
curl -L https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Regular/complete/JetBrains%20Mono%20Regular%20Nerd%20Font%20Complete%20Mono.ttf?raw=true --output "src/glyphs/JetBrainsMono NF.ttf"


pwsh ./init.ps1

chmod +x ./install-git-town.sh
chmod +x ./install-powershell.sh
chmod +x ./install-terraform.sh
chmod +x ./install-gitversion.sh


bash ./install-git-town.sh
# bash ./install-powershell.sh
bash ./install-gitversion.sh

ok "finished with dotfiles"