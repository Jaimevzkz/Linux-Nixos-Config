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
      kt="/home/vzkz/Own_Pojects/kotlin_WorkSpace && eza --icons -lah";
      sl="/home/vzkz/Own_Pojects/Salamandra && eza --icons -lah";
      dw="/home/vzkz/Downloads && eza --icons -lah";
      slmpull="cd salamandra-server && echo \"\nPull server:\" && git pull && cd .. && cd salamandra-android && echo \"\nPull android:\" && git pull && cd .. && cd notes && echo \"\nPull notes:\" && git pull && cd ..";
      cd = "z";
      update = "sudo nixos-rebuild switch --flake ~/nixos/#nixos-config";
      shell = "nix develop --command zsh";
      lg = "lazygit";
      psh = ''
        if [ -z "$1" ]; then
          echo "Por favor, proporciona un mensaje de commit."
        else
          git add . && git commit -m "$1" && git push
        fi
      '';

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
  };


}
