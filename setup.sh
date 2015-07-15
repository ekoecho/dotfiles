#!/bin/bash

if [ ! -d ~/zgen ]; then
  echo "Getting zgen files"
  git clone https://github.com/tarjoilija/zgen.git ~/zgen
fi

if [ ! -f ~/.zshrc ]; then
  echo "Linking zshrc"
  ln -s ~/dotfiles/zshrc ~/.zshrc
fi


if [ ! -f ~/.tmux.conf ]; then
  echo "Linking tmux.conf"
  ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
fi
