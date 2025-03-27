#!/bin/bash
cd ~/dotfiles/baseline/.config

for dir in */; do
	base=$(basename "$dir")
	nested="$dir$base"

	if [ -d "$nested" ]; then
		echo "📦 Flattening $dir$base → $dir"
		mv "$nested"/* "$dir"
		rm -rf "$nested"
	fi
done

echo "✅ All nested app folders flattened!"
