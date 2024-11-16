#!/bin/sh

BACKUP_FILE=~/.zshrc-$(date +%s).backup

if ! cmp -s ~/.zshrc ./.zshrc; then
  cp ~/.zshrc $BACKUP_FILE
  cp ./.zshrc ~/.zshrc

  echo "Backup created: $BACKUP_FILE"
fi

cp .zshrc ~/.zshrc
mkdir -p ~/.zsh/zsh-autosuggestions
mkdir -p ~/.zsh/zsh-vi-mode

cd .zsh
cp ./history.zsh ~/.zsh/history.zsh
cp -n ./env.zsh ~/.zsh/env.zsh
cp -n ./aliases.zsh ~/.zsh/aliases.zsh

cp -r ./zsh-autosuggestions/* ~/.zsh/zsh-autosuggestions/
cp -r ./zsh-vi-mode/* ~/.zsh/zsh-vi-mode/

echo "ZSH configuration installed"
