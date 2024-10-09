{ inputs
, pkgs
, ...
}:
let
  machineSpecific = import ./machine-specific.nix;
in
{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = { vzkz = import ./home.nix; };
    backupFileExtension = "backup";
  };

  nixpkgs.overlays = [

  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable xserver
  services.xserver.enable = true;

  # Enable i3 window manager
  services.xserver.windowManager.i3.enable = true;
  services.picom.enable = true;

  # Enable the gdm display manager.
  services.xserver.displayManager.gdm.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.desktopManager.gnome.enable = true;

  # Enable Hyprland tiling window manager
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  programs.waybar.enable = true;
  xdg.portal.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  fonts.packages = with pkgs; [
    fira-code-nerdfont
    font-awesome
  ];

  networking.hostName = "nixos";

  programs.firefox.enable = true;
  # services.blueman.enable = true;
  environment.systemPackages = with pkgs; [
    # Util 
    cmake
    gcc
    gdb
    git
    pamixer # Volume control
    brightnessctl
    unzip
    blueman
    lua
    texliveFull
    zathura # Latex document viewer
    cargo
    openssl
    libreoffice
    python3
    ledger

    # Terminal
    vim
    neovim
    neofetch
    fastfetch
    htop
    eza
    zoxide
    alacritty
    zsh
    starship
    tmux
    lazygit
    cmatrix
    tree
    kitty

    # LSP
    sumneko-lua-language-server
    rust-analyzer
    clang-tools
    kotlin-language-server
    ktlint
    stylua
    nil
    nixpkgs-fmt

    # Apps
    signal-desktop
    home-manager
    webcord
    androidStudioPackages.dev
    obsidian
    syncthing
    keepassxc

    # i3
    polybar
    feh
    killall
    rofi
    pavucontrol
    pipewire
    dunst
    betterlockscreen
    i3lock
    xautolock

    # Hyprland
    waybar
    libnotify
    hyprpaper
    networkmanagerapplet
    hyprlock
    hypridle
    clipman
    wofi
    hyprshot
  ];

  users.users = {
    vzkz = {
      isNormalUser = true;
      description = "Jaime";
      extraGroups = [ "networkmanager" "wheel" "docker" ];
      packages = with pkgs; [
      ];
      shell = pkgs.zsh;
    };
  };

  #enable zsh and set it as default
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  # Docker
  virtualisation.docker.enable = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Madrid";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };


  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "intl";
    options = "ctrl:nocaps";
  };


  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  #system.stateVersion = "23.05";
  system.stateVersion = machineSpecific.system.stateVersion;
}
