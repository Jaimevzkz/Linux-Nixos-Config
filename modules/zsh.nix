{ config, pkgs, ... }:
{
  #Zsh
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting = {
      enable = true;
    };

    shellAliases = {
      l = "eza -lah --icons --git --sort=Extension";
      v = "nvim";
      e = "exit";
      kt="/home/vzkz/Own_Projects/kotlin_WorkSpace && eza --icons -lah";
      sl="/home/vzkz/Own_Projects/Salamandra && eza --icons -lah";
      dw="/home/vzkz/Downloads && eza --icons -lah";
      slmpull="cd server && echo \"\nPull server:\" && git pull --recurse-submodules && cd .. && cd android && echo \"\nPull android:\" && git pull && cd ..";
      cd = "z";
      update = "sudo nixos-rebuild switch --flake ~/nixos/#nixos-config";
      shell = "nix develop --command zsh";
      lg = "lazygit";
      psh = "git add . && git commit -m \"update\" && git push";
      t = "tmux attach || tmux";
      wifi = "sudo nmtui";
      bluetooth = "blueman-manager";
      logout = "pkill -KILL -u $USER";
    };

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
      ];
    };

    history = {
      size = 10000;
    };
    initExtra = ''
      if command -v fastfetch &> /dev/null; then
        fastfetch
      fi
    '';
  };
}
