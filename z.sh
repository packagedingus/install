#!/bin/zsh

INSTALL_DIR="$HOME/bin"
PACKAGE_DIR="$HOME/packages"

mkdir -p "$INSTALL_DIR" "$PACKAGE_DIR"

echo "Downloading package manager script from GitHub..."
curl -fsSL "https://github.com/packagedingus/packagedingus/pkg.sh" -o "$INSTALL_DIR/pkg"

chmod +x "$INSTALL_DIR/pkg"

if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
  echo "Adding $INSTALL_DIR to the PATH..."
  echo "export PATH=\"$INSTALL_DIR:\$PATH\"" >> "$HOME/.zshrc"
  source "$HOME/.zshrc"
fi

echo "Package manager installed successfully. You can now run: pkg"
