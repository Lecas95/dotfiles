#!/bin/bash
# Bootstrap script to set up dotfiles and install packages

set -e

# Clone dotfiles
echo '📥 Cloning dotfiles...'
git clone https://github.com/<your-username>/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Install stow if not present
if ! command -v stow &> /dev/null; then
  echo '📦 Installing stow...'
  sudo pacman -S --noconfirm stow
fi

# Symlink all configs using stow
echo '🔗 Stowing configurations...'
stow */

# Install packages
if [ -f pkglist.txt ]; then
  echo '📦 Installing pacman packages...'
  sudo pacman -S --needed - < pkglist.txt
fi

if [ -f aurlist.txt ]; then
  echo '📦 Installing AUR packages (requires yay)...'
  yay -S --needed - < aurlist.txt
fi

echo '✅ Dotfiles bootstrap complete!'