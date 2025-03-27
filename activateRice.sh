#!/bin/bash
set -e

DOTFILES=~/dotfiles

echo "🎨 Available rices:"
select RICE in "$DOTFILES"/*/; do
	RICE=$(basename "$RICE")
	break
done

CONFIG_DIR="$DOTFILES/$RICE/.config"

if [ ! -d "$CONFIG_DIR" ]; then
	echo "❌ $RICE does not contain a .config directory"
	exit 1
fi

echo "🧼 Unstowing previous config (if any)..."
stow -D --dir="$CONFIG_DIR" --target="$HOME/.config" $(ls "$CONFIG_DIR")

echo "🧽 Removing broken symlinks..."
find ~/.config -xtype l -delete

echo "🔗 Stowing '$RICE' config..."
stow --dir="$CONFIG_DIR" --target="$HOME/.config" $(ls "$CONFIG_DIR")

# Optional: install packages
if [ -f "$DOTFILES/$RICE/pkglist.txt" ]; then
	echo "📦 Installing pacman packages..."
	sudo pacman -S --needed - <"$DOTFILES/$RICE/pkglist.txt"
fi

if [ -f "$DOTFILES/$RICE/aurlist.txt" ]; then
	echo "📦 Installing AUR packages..."
	if command -v yay &>/dev/null; then
		yay -S --needed - <"$DOTFILES/$RICE/aurlist.txt"
	else
		echo "⚠️ yay not found, skipping AUR packages."
	fi
fi

echo "✅ Rice '$RICE' activated successfully!"
