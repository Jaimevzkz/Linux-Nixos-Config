{ pkgs, ... }:
{
  imports = [
    #./modules/zsh.nix
    ./modules/alacritty.nix
    ./modules/starship.nix
    #./modules/tmux.nix
    #./modules/i3.nix
  ];
  home.username = "vzkz";
  home.homeDirectory = "/home/vzkz";

  home.packages = [
    pkgs.hello
  ];

  # Zoxide
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  # Git configuration
  programs.git = {
    enable = true;
    userName = "Jaimevzkz";
    userEmail = "jaimevazquezmartin@protonmail.com";
    extraConfig = {
      core.sshCommand = "ssh -i ~/.ssh/id_ed25519";
    };
  };

  programs.home-manager.enable = true;
  home.stateVersion = "23.05";
}










