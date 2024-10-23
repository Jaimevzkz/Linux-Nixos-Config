{ pkgs, ... }:

{
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
    xsel # For nvim clipboard 
    wl-clipboard # sync
    go
    mage
    dos2unix
    awscli
    android-tools
    usbutils

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
    slack
    chrome

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
}

