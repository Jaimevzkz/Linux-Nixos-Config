#!/run/current-system/sw/bin/bash

# Expand the tilde to the user's home directory
HOME_DIR=$(eval echo ~$USER)

# Define your configurations
CONFIG_BLUE="$HOME_DIR/nixos/dotfiles/waybar/blue/config"
STYLE_BLUE="$HOME_DIR/nixos/dotfiles/waybar/blue/style.css"

CONFIG_CATTPUCCIN="$HOME_DIR/nixos/dotfiles/waybar/catppuccin/config"
STYLE_CATTPUCCIN="$HOME_DIR/nixos/dotfiles/waybar/catppuccin/style.css"

CONFIG_TYPECRAFT="$HOME_DIR/nixos/dotfiles/waybar/typecraft/config.jsonc"
STYLE_TYPECRAFT="$HOME_DIR/nixos/dotfiles/waybar/typecraft/style.css"

# Set the configuration number here (1 for Blue, 2 for Catppuccin, 3 for Typecraft)
CONFIG_NUMBER=1

# Select the configuration based on the number
case $CONFIG_NUMBER in
    1)
        WAYBAR_CONFIG=$CONFIG_BLUE
        WAYBAR_STYLE=$STYLE_BLUE
        ;;
    2)
        WAYBAR_CONFIG=$CONFIG_CATTPUCCIN
        WAYBAR_STYLE=$STYLE_CATTPUCCIN
        ;;
    3)
        WAYBAR_CONFIG=$CONFIG_TYPECRAFT
        WAYBAR_STYLE=$STYLE_TYPECRAFT
        ;;
    *)
        echo "Invalid configuration number. Please choose 1, 2, or 3."
        exit 1
        ;;
esac

# Launch Waybar with custom config and style
waybar -c "$WAYBAR_CONFIG" -s "$WAYBAR_STYLE" & disown

