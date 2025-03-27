#!/bin/bash
set -e

DOTFILES=~/dotfiles
CONFIG_TARGET="$HOME/.config"

echo "🎨 Available rices:"
select RICE in "$DOTFILES"/*/ ; do
  RICE=$(basename "$RICE")
  break
done

RICE_PATH="$DOTFILES/$RICE"
STOW_DIR="$RICE_PATH/stow"

if [ ! -d "$STOW_DIR" ]; then
  echo "❌ '$STOW_DIR' not found. Make sure your rice is structured as stow/<package>/<app>/"
  exit 1
fi

echo "🧽 Removing broken symlinks from ~/.config..."
find "$CONFIG_TARGET" -xtype l -delete

echo "🚫 Unstowing any previously linked packages..."
cd "$STOW_DIR"
stow -D -t "$CONFIG_TARGET" */

echo "🔗 Stowing packages cleanly from '$STOW_DIR'..."
stow -t "$CONFIG_TARGET" */

echo "📦 Installing packages if pkglist.txt or aurlist.txt are found..."
if [ -f "$RICE_PATH/pkglist.txt" ]; then
  sudo pacman -S --needed - < "$RICE_PATH/pkglist.txt"
fi

if [ -f "$RICE_PATH/aurlist.txt" ]; then
  if command -v yay &> /dev/null; then
    yay -S --needed - < "$RICE_PATH/aurlist.txt"
  else
    echo "⚠️ yay not found. Skipping AUR install."
  fi
fi

echo "✅ Rice '$RICE' applied cleanly and correctly!"
