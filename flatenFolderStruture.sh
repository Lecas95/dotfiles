#!/bin/bash
cd baseline/.config

for outer in */; do
	inner="$outer/.config"

	# If nested .config exists
	if [ -d "$inner" ]; then
		echo "📦 Flattening $outer..."
		# Move contents up
		mv "$inner"/* "$outer"
		# Remove inner .config
		rm -rf "$inner"
	fi
done

echo "✅ Rice folder structure flattened!"
