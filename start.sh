#!/bin/bash -x

until xcode-select --install 2>&1 | grep --quiet "already installed"
do
  echo "Waiting for xcode to finish installing"
  sleep 5 
done

sudo softwareupdate --install-rosetta

sudo pip3 install --upgrade pip
pip3 install ansible

echo "export PATH=\"$HOME/Library/Python/3.9/bin:/opt/homebrew/bin:$PATH\"" >> ~/.zshrc

export PATH=$HOME/Library/Python/3.9/bin:/opt/homebrew/bin:$PATH

ansible-galaxy install -r requirements.yml

ansible-playbook --ask-become-pass main.yml

open /Applications/Google\ Chrome.app --url https://accounts.google.com

open /Applications/1Password.app

open /Applications/Cinch.app
