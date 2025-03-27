#!/bin/bash
set -e

STOW_DIR=~/dotfiles/baseline/stow

echo "📦 Reorganizing all stow packages into '.config/<app>' structure..."

for app_path in "$STOW_DIR"/*; do
  [ -d "$app_path" ] || continue
  app_name=$(basename "$app_path")
  target_path="$app_path/.config/$app_name"

  echo "🔁 Moving contents of '$app_name' into '$target_path'..."

  mkdir -p "$target_path"
  shopt -s dotglob
  mv "$app_path"/* "$target_path/" 2>/dev/null || true
  shopt -u dotglob
done

echo "✅ All stow packages have been fixed!"
echo "👉 You can now safely run:"
echo "   cd ~/dotfiles/baseline/stow && stow -t ~/.config */"
