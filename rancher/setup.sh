#!/bin/bash

# Ensure the script is executable
# chmod +x setup.sh 

# Function to set the nameserver to Google's DNS
set_nameserver() {
    echo "nameserver 8.8.8.8" >> /etc/resolv.conf

# Function to update apk repositories and install openssh
install_openssh() {
    apk update
    apk add openssh
    ssh-keygen -V
}

# Function to install the shadow package using apk (Alpine Linux package manager)
# This is used to have chsh available as well
install_shadow() {
    apk update
    apk add shadow
    chsh --version
}

# Function to install zsh using apk (Alpine Linux package manager)
install_zsh() {
    apk update
    apk add zsh
}

# Function to install Python using apk (Alpine Linux package manager)
install_python() {
    apk update
    apk add python3
    # ln -sf python3 /usr/bin/python
    python --version
}

# Function to set git core.autocrlf to input globally this is to avoid difference between windows and linux
set_git_autocrlf() {
    git config --global core.autocrlf input
}

# Function to install oh-my-zsh
install_oh_my_zsh() {
    echo "Installing oh-my-zsh..." && \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    echo "Installing oh-my-zsh Finished!"
}

# Function to link dotfiles from the repository to the user's home directory
link_dotfiles() {
    echo "Linking Dotfiles..." && \
    rm -rf ../../.profile && ln rancher/.profile ../../.profile && \
    rm -rf ../../.zshrc && ln zsh/.zshrc ../../.zshrc && \
    rm -rf ../../.oh-my-zsh/themes/papacidero.zsh-theme && \
    ln zsh/.oh-my-zsh/themes/papacidero.zsh-theme ../../.oh-my-zsh/themes/papacidero.zsh-theme && \
    rm -rf ../../.oh-my-zsh/plugins/common-aliases/common-aliases.plugin.zsh && \
    ln zsh/.oh-my-zsh/plugins/common-aliases/common-aliases.plugin.zsh ../../.oh-my-zsh/plugins/common-aliases/common-aliases.plugin.zsh && \
    echo "Linking Dotfiles Finished!"
}

# Call functions as needed
# set_nameserver
# install_shadow
# install_oh_my_zsh
# link_dotfiles
