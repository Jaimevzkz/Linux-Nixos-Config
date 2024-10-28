#!/usr/bin/env bash
# Define the directory containing your dotfiles
DOTFILES_DIR=~/nixos/dotfiles

# List of directories to link
# "waybar" "hypr"
CONFIG_DIRS=("nvim" "i3" "polybar" "picom" "rofi" "hypr" "waybar" "wofi" "fastfetch" "kitty" "dunst" )  # Add other directories as needed
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

# Add .tmux.conf symbolic link
TMUX_SRC="$DOTFILES_DIR/.tmux.conf"
TMUX_DEST="$HOME/.tmux.conf"

# Add .zshrc symbolic link
ZSH_SRC="$DOTFILES_DIR/.zshrc"
ZSH_DEST="$HOME/.zshrc"

# XSH: Check if the destination already exists and remove it if it's a symlink
if [ -L "$ZSH_DEST" ]; then
  echo "Removing existing symlink at $ZSH_DEST"
  rm "$ZSH_DEST"
elif [ -e "$ZSH_DEST" ]; then
  echo "Backing up existing file at $ZSH_DEST to $ZSH_DEST.bak"
  mv "$ZSH_DEST" "$ZSH_DEST.bak"
fi
# Create the symbolic link for .zshrc
echo "Creating symlink from $ZSH_SRC to $ZSH_DEST"
ln -s "$ZSH_SRC" "$ZSH_DEST"


# TMUX: Check if the destination already exists and remove it if it's a symlink
if [ -L "$TMUX_DEST" ]; then
  echo "Removing existing symlink at $TMUX_DEST"
  rm "$TMUX_DEST"
elif [ -e "$TMUX_DEST" ]; then
  echo "Backing up existing file at $TMUX_DEST to $TMUX_DEST.bak"
  mv "$TMUX_DEST" "$TMUX_DEST.bak"
fi

# Create the symbolic link for .tmux.conf
echo "Creating symlink from $TMUX_SRC to $TMUX_DEST"
ln -s "$TMUX_SRC" "$TMUX_DEST"

echo "All symbolic links have been created."

