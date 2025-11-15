#!/bin/sh

echo "Installing tmux"
yay -S --noconfirm --needed tmux

ORIGINAL_DIR=($pwd)
REPO_URL="https://github.com/tmux-plugins/tpm"
REPO_NAME=".tmux/plugins/tpm"

cd ~

# Check if repo exists and clone if not
if [ -d "$REPO_NAME" ]; then
  echo "Repository '$REPO_NAME' already exists. Skipping clone"
else
  git clone "$REPO_URL" "$REPO_NAME"
fi

echo "tmux installed, remember to <leader>I to install plugins"
