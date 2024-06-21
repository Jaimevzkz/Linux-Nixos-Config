{ config, pkgs, ... }:

{
  #Alacritty
  programs.alacritty = {
    enable = true;

    settings = {
      window = {
        opacity = 0.9;
        padding.x = 10;
        padding.y = 10;
        decorations = "none";
        decorations_theme_variant = "Dark";
        startup_mode = "maximized";
      };
      font = {
        normal.family = "FiraCode Nerd Font";
        bold.family = "FiraCode Nerd Font";
        italic.family = "FiraCode Nerd Font";
        bold_italic.family = "FiraCode Nerd Font";
        size = 14.0;
      };
      #shell.program = "/run/current-system/sw/bin/zsh";
      shell = {
        program = "/run/current-system/sw/bin/zsh";
        args = ["-l" "-c" "tmux attach || tmux"];
      };

      colors = {
        primary = {
          background = "#10100E";
          foreground = "#C6C6C4";
        };
        normal = {
          black = "#10100E"; 
          red = "#C40233";
          green = "#009F6B"; 
          yellow = "#FFD700";
          blue = "#0087BD"; 
          magenta = "#9A4EAE";
          cyan = "#20B2AA"; 
          white = "#C6C6C4";
        };
        bright = {
          black = "#696969"; 
          red = "#FF2400"; 
          green = "#03C03C";
          yellow = "#FDFF00";
          blue = "#007FFF";
          magenta = "#FF1493";
          cyan = "#00CCCC";
          white = "#FFFAFA";
        };
      };
    };
  };

}

