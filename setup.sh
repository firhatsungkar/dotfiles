#!/usr/bin/env bash

ln -sf $HOME/.dotfiles/.vimrc $HOME/.vimrc
ln -sf $HOME/.dotfiles/.aliases $HOME/.aliases
ln -sf $HOME/.dotfiles/.tmux.conf $HOME/.tmux.conf

if [ ! -d "($HOME)/.config" ]; then
  mkdir -p "($HOME)/.config";
fi

ln -sf $HOME/.dotfiles/.config/nvim $HOME/.config/nvim
