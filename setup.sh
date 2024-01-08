#!/usr/bin/env bash

ln -sf $HOME/.dotfiles/.vimrc $HOME/.vimrc
ln -sf $HOME/.dotfiles/.profile $HOME/.profile
ln -sf $HOME/.dotfiles/.wsl_profile $HOME/.wsl_profile
ln -sf $HOME/.dotfiles/.mac_profile $HOME/.mac_profile
ln -sf $HOME/.dotfiles/.tmux.conf $HOME/.tmux.conf

if [ ! -d "($HOME)/.config" ]; then
  mkdir -p "($HOME)/.config";
fi

ln -sf $HOME/.dotfiles/tmux $HOME/.config/tmux
ln -sf $HOME/.dotfiles/nvim $HOME/.config/nvim
ln -sf $HOME/.dotfiles/alacritty $HOME/.config/alacritty
