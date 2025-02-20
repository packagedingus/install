#!/bin/bash

DINGUS_DIR="$HOME/dingus"
BIN_DIR="$DINGUS_DIR/bin"
PACKAGES_DIR="$DINGUS_DIR/packages"

echo "🚀 Starting installation of package dingus..."
sleep 1

mkdir -p "$BIN_DIR" "$PACKAGES_DIR"
echo "📂 Created necessary directories at $DINGUS_DIR."

echo "⬇️ Downloading package dingus..."
curl -fsSL "https://github.com/packagedingus/packagedingus/raw/main/dingus.sh" -o "$BIN_DIR"
chmod +x "$BIN_DIR"
echo "✅ package dingus installed successfully."

if [[ ":$PATH:" != *":$BIN_DIR:"* ]]; then
  echo "🛠️ Adding package dingus to your PATH..."
  echo "export PATH=\"$BIN_DIR:\$PATH\"" >> "$HOME/.bashrc"

  echo "🔄 Reloading shell configuration..."
  source "$HOME/.bashrc"
  echo "✅ Shell configuration reloaded."
  echo "✅ PATH updated."
fi

echo "🎉 Installation complete! You can now use package dingus by running: dingus"
