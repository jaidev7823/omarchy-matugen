#!/bin/bash

echo "🚀 Setting up Omarchy-Matugen Sync..."

# 1. Create directories
mkdir -p ~/.local/bin
mkdir -p ~/.config/matugen/templates

# 2. Link the scripts
cp bin/omarchy-sync ~/.local/bin/
cp bin/swaybg ~/.local/bin/
chmod +x ~/.local/bin/omarchy-sync ~/.local/bin/swaybg

# 3. Link Matugen configs
cp matugen/config.toml ~/.config/matugen/
cp matugen/templates/kitty.conf ~/.config/matugen/templates/

# 4. Final instructions
echo "✅ Setup complete!"
echo "👉 Add 'include matugen.conf' to your kitty.conf"
echo "👉 Ensure ~/.local/bin is in your PATH"