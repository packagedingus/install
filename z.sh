#!/bin/bash

DINGUS_DIR="$HOME/dingus"
BIN_DIR="$DINGUS_DIR/bin"
PACKAGES_DIR="$DINGUS_DIR/packages"

echo "🚀 Starting installation of package dingus..."
sleep 1

mkdir -p "$BIN_DIR" "$PACKAGES_DIR"
echo "📂 Created necessary directories at $DINGUS_DIR."

echo "⬇️ Downloading package dingus..."
curl -fsSL "https://github.com/packagedingus/packagedingus/raw/main/dingus.sh" -o "$BIN_DIR/dingus"
chmod +x "$BIN_DIR/dingus"
echo "✅ package dingus installed successfully at $BIN_DIR/dingus."

if [[ "$SHELL" == */zsh ]]; then
  PROFILE_FILE="$HOME/.zshrc"
elif [[ "$SHELL" == */bash ]]; then
  PROFILE_FILE="$HOME/.bashrc"
else
  PROFILE_FILE="$HOME/.profile"
fi

if [[ ":$PATH:" != *":$BIN_DIR:"* ]]; then
  echo "🛠️ Adding package dingus to your PATH..."
  echo "export PATH=\"$BIN_DIR:\$PATH\"" >> "$PROFILE_FILE"
  
  echo "🔄 Reloading shell configuration..."
  source "$PROFILE_FILE"
  
  echo "✅ PATH updated."
fi

echo "🎉 Installation complete! You can now use package dingus by running: dingus"
