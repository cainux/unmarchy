#!/bin/sh

echo "Installing Volta"
yay -S --noconfirm --needed volta

echo "... node"
volta install node

echo "... yarn"
volta install yarn
