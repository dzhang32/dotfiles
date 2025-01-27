#!/bin/bash

# Define the source directory (where the dotfiles are stored)
DOTFILES_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# Define the target directory (home directory by default)
TARGET_DIR="$HOME"

# Loop through all files prefixed with "." in the dotfiles directory
for file in "$DOTFILES_DIR"/.*; do
  # Skip current (.) and parent (..) directories
  [[ $(basename "$file") == "." || $(basename "$file") == ".." ]] && continue

  # Calculate the target symlink path
  target="$TARGET_DIR/$(basename "$file")"

  # Check if the symlink or target already exists
  if [[ -L "$target" ]]; then
    echo "Symlink already exists for $(basename "$file"), skipping."
  elif [[ -e "$target" ]]; then
    echo "File or directory already exists at $target, skipping."
  else
    # Create the symlink
    ln -s "$file" "$target"
    echo "Symlink created for $(basename "$file") -> $target"
  fi
done