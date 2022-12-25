#!/usr/bin/env bash

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)


# Install utilities
brew install git
brew install lazygit
brew install curl
brew install wget --with-iri
brew install openssh
brew install grep
brew insatll lua
brew install vim --with-override-system-vi
brew install neovim
brew install tmux
brew install fdfind
brew install tty-clock
brew install duf
brew install bat
brew install htop
brew install ncdu
brew install neofetch
brew install zsh
brew install zsh-autosuggestions
brew install z
brew install fzf
brew install spaceship
brew install nvm
brew install pyenv
brew install toilet
brew install ripgrep

# Install Specific MacOS Apps
if [[ "$OSTYPE" == "darwin"* ]]; then
  # Install GNU core utilities (those that come with macOS are outdated).
  # Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
  brew install coreutils
  ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"
  
  # Install some other useful utilities like `sponge`.
  brew install moreutils
  # Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
  brew install findutils
  # Install GNU `sed`, overwriting the built-in `sed`.
  brew install gnu-sed --with-default-names

  # Other cool stuff
  brew install --cask iterm2
  brew install --cask visual-studio-code
  brew install --cask rectangle
  brew install --cask linearmouse
  brew install --cask topnotch
  brew install --cask latest  
  brew install --cask shottr
  brew install --cask hiddenbar
  brew install --cask maccy
  brew install --cask spotify
  brew install --cask raycast
  brew install --cask google-chrome
  brew install --cask firefox


  echo "Install manually"
  echo "https://apps.apple.com/us/app/hotkey-app/id975890633?mt=12"
  echo "https://goodsnooze.gumroad.com/l/pippo"
  echo "https://hovrly.com/"
fi

# Install Cool Font
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font
brew install --cask font-caskaydia-cove-nerd-font
brew install --cask font-hack-nerd-font
brew install --cask font-fira-code-nerd-font

# Remove outdated versions from the cellar.
brew cleanup
