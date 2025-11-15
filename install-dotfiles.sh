#!/bin/sh

ORIGINAL_DIR=($pwd)
REPO_URL="https://github.com/cainux/dotfiles"
REPO_NAME="dotfiles"

is_stow_installed() {
  pacman -Qi "stow" &> /dev/null
}

if ! is_stow_installed; then
  echo "Install stow first"
  exit 1
fi

cd ~

# Check if repo exists and clone if not
if [ -d "$REPO_NAME" ]; then
  echo "Repository '$REPO_NAME' already exists. Skipping clone"
else
  git clone "$REPO_URL"
fi

# Check if clone was successful
if [ $? -eq 0 ]; then
  echo "Removing old configs"
  rm -rf ~/.config/ghostty ~/.config/nvim

  cd "$REPO_NAME"
  stow ghostty
  stow nvim
else
  echo "Failed to clone the repository"
  exit 1
fi
