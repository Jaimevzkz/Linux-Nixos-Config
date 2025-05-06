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
    dos2unix
    awscli
    android-tools
    usbutils
    bash
    ripgrep
    nodejs
    mage
    gotools
    golangci-lint
    protobuf_23
    protoc-gen-go
    alsa-utils # debug volume
    sof-firmware # same
    nodePackages_latest.cspell # Spell checker for markdown
    kanshi # disable laptop screen with external monitor

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
    fzf
    bat


    # LSP
    sumneko-lua-language-server
    rust-analyzer
    clang-tools
    kotlin-language-server
    ktlint
    stylua
    nil
    nixpkgs-fmt
    gopls

    # Apps
    signal-desktop
    home-manager
    webcord
    android-studio
    obsidian
    syncthing
    keepassxc
    slack
    chromium
    vscode
    remmina

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
