#!/bin/bash
set -e

STOW_DIR=~/dotfiles/baseline/stow

echo "📦 Fixing .config nesting inside stow packages..."

for package in "$STOW_DIR"/*; do
  [ -d "$package" ] || continue
  inner_config="$package/.config"
  if [ -d "$inner_config" ]; then
    for inner in "$inner_config"/*; do
      [ -e "$inner" ] || continue
      echo "🔁 Moving $(basename "$inner") from $inner_config → $package"
      mv "$inner" "$package/"
    done
    rmdir "$inner_config" 2>/dev/null || true
  fi
done

echo "✅ Flattening complete! You can now run:"
echo "   cd ~/dotfiles/baseline/stow && stow -t ~/.config */"
