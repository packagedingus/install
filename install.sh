#!/bin/bash

INSTALL_DIR="$HOME/bin"
PACKAGE_MANAGER_NAME="pkg"


if [ ! -d "$INSTALL_DIR" ]; then
  echo "Creating $INSTALL_DIR..."
  mkdir -p "$INSTALL_DIR"
fi

echo "Downloading package manager script from GitHub..."
curl -fsSL "https://github.com/packagedingus/packagedingus/pkg.sh" -o "$INSTALL_DIR/$PACKAGE_MANAGER_NAME"


chmod +x "$INSTALL_DIR/$PACKAGE_MANAGER_NAME"

if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
  echo "Adding $INSTALL_DIR to the PATH..."
  echo "export PATH=\"$INSTALL_DIR:\$PATH\"" >> "$HOME/.bashrc"  # For Bash users
  # For Zsh users, uncomment the following line
  # echo "export PATH=\"$INSTALL_DIR:\$PATH\"" >> "$HOME/.zshrc"
  source "$HOME/.bashrc"  # For Bash users
  # For Zsh users, uncomment the following line
  # source "$HOME/.zshrc"
fi

# Verify the installation
echo "Package manager installed successfully. You can now run: pkg"
