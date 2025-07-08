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
    #protobuf_23
    protoc-gen-go
    alsa-utils # debug volume
    sof-firmware # same
    nodePackages_latest.cspell # Spell checker for markdown
    kanshi # disable laptop screen with external monitor
    nodejs_20
    pnpm

    # shaders compatibility
    gnumake
    clang
    glslang
    #OpenGl
    libGL
    libGLU
    glew
    mesa-gl-headers
    libglibutil
    xorg.libX11
    xorg.libXext
    xorg.libXrandr
    xorg.libXxf86vm
    xorg.libXi
    # Vulkan
    vulkan-tools
    vulkan-loader
    vulkan-headers

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
    spotify
    virtualbox

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
