{ config, pkgs, ... }:

{
  #Alacritty
  programs.alacritty = {
    enable = true;

    settings = {
      window = {
        opacity = 0.9;
        decorations = "none";
        decorations_theme_variant = "Dark";
        startup_mode = "maximized";
      };
      font = {
        normal.family = "FiraCode Nerd Font";
        bold.family = "FiraCode Nerd Font";
        italic.family = "FiraCode Nerd Font";
        bold_italic.family = "FiraCode Nerd Font";

        #normal.family = "MesloLGSDZ Nerd Font Mono";
        #bold.family = "MesloLGS Nerd Font Mono";
        #italic.family = "MesloLGS Nerd Font Mono";
        #bold_italic.family = "MesloLGS Nerd Font Mono";

        #normal.family = "JetBrainsMono Nerd Font";
        #bold.family = "JetBrainsMono Nerd Font";
        #italic.family = "JetBrainsMono Nerd Font";
        #bold_italic.family = "JetBrainsMono Nerd Font";

        size = 14.5;
        #size = 11.0;
      };
      #shell.program = "/run/current-system/sw/bin/zsh";
      shell = {
        program = "/run/current-system/sw/bin/zsh";
        #args = ["-l" "-c" "tmux attach || tmux"]; # Open tmux session every time alcritty is opened
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

