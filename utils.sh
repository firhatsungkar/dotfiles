#!/usr/bin/env bash

# MacOS command Utils

# Utils flag dir
UTILS_FLAG_DIR="$HOME/.dotfiles/.utils"
FLAG_NAME="utils"
if [[ ! -d "$UTILS_FLAG_DIR" ]]; then
  mkdir -p "$UTILS_FLAG_DIR"
fi

create_flag() {
  local FLAG="$UTILS_FLAG_DIR/$FLAG_NAME"
  echo "dir is: $FLAG"
  if [[ ! -f "$FLAG"  ]]; then
    touch "$FLAG"
  fi
}

if [[ "$OSTYPE" == "darwin"* ]]; then
  # sudo touch id
  FLAG_NAME="sudo_touch_id"
  if [[ ! -f "$UTILS_FLAG_DIR/$FLAG_NAME" ]]; then
    sudo echo "auth sufficient pam_tid.so" >> /etc/pam.d/sudo
    create_flag
  fi

  defaults write com.apple.screencapture type jpg
fi

