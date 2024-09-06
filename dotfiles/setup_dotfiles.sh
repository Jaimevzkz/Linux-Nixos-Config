#!/usr/bin/env bash
# Define the directory containing your dotfiles
DOTFILES_DIR=~/nixos/dotfiles

# List of directories to link
# "waybar" "hypr"
CONFIG_DIRS=("nvim" "i3" "polybar" "picom" "rofi" "hypr" "waybar" "wofi" "fastfetch" "Google")  # Add other directories as needed
HOME_DIRS=("wallpaper")  # Add other directories as needed

# Create symbolic links
for DIR in "${CONFIG_DIRS[@]}"; do
  SRC="$DOTFILES_DIR/$DIR"
  DEST="$HOME/.config/$DIR"

  # Check if the destination already exists and remove it if it's a symlink
  if [ -L "$DEST" ]; then
    echo "Removing existing symlink at $DEST"
    rm "$DEST"
  elif [ -e "$DEST" ]; then
    echo "Backing up existing directory at $DEST to $DEST.bak"
    mv "$DEST" "$DEST.bak"
  fi

  # Create the symbolic link
  echo "Creating symlink from $SRC to $DEST"
  ln -s "$SRC" "$DEST"
done

for DIR in "${HOME_DIRS[@]}"; do
  SRC="$DOTFILES_DIR/$DIR"
  DEST="$HOME/$DIR"

  # Check if the destination already exists and remove it if it's a symlink
  if [ -L "$DEST" ]; then
    echo "Removing existing symlink at $DEST"
    rm "$DEST"
  elif [ -e "$DEST" ]; then
    echo "Backing up existing directory at $DEST to $DEST.bak"
    mv "$DEST" "$DEST.bak"
  fi

  # Create the symbolic link
  echo "Creating symlink from $SRC to $DEST"
  ln -s "$SRC" "$DEST"
done

echo "All symbolic links have been created."

