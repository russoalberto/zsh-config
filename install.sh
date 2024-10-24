#!/bin/sh

BACKUP_FILE=~/.zshrc-$(date +%s).backup

if ! cmp -s ~/.zshrc ./.zshrc; then
  cp ~/.zshrc $BACKUP_FILE
  cp ./.zshrc ~/.zshrc

  echo "Backup created: $BACKUP_FILE"
fi

cp .zshrc ~/.zshrc
mkdir -p ~/.zsh/zsh-autosuggestions

cd .zsh
cp ./history.zsh ~/.zsh/history.zsh
cp -n ./env.zsh ~/.zsh/env.zsh
cp -n ./aliases.zsh ~/.zsh/aliases.zsh

cd ./zsh-autosuggestions/
cp -r * ~/.zsh/zsh-autosuggestions/

echo "ZSH configuration installed"
