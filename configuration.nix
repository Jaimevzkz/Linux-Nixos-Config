{ inputs
, pkgs
, ...
}:
let
  androidStudioGiraffe = import ./android-studio-giraffe.nix { inherit pkgs; };
in
{
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = { vzkz = import ./home.nix; };
    backupFileExtension = "backup";
  };
  environment.systemPackages = [ androidStudioGiraffe ];

  nixpkgs.config = {
    android_sdk.accept_license = true;
  };

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged programs
    clang
  ];

  # 32Bit compatibility
  hardware.graphics.enable32Bit = true;
  hardware.pulseaudio.support32Bit = true;

  # Nvidia
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true; # Use open-source driver modules for NVIDIA GPUs Turing and later
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.chromium.enable = true;
  nixpkgs.config.chromium = { enableWideVine = true; };

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
    nerd-fonts.fira-code
    font-awesome
  ];

  networking.hostName = "nixos";

  programs.firefox.enable = true;

  services.udev.packages = [ pkgs.android-udev-rules ];

  users.users = {
    vzkz = {
      isNormalUser = true;
      description = "Jaime";
      extraGroups = [ "networkmanager" "wheel" "docker" ];
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
  #time.timeZone = "Atlantic/Canary";

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
  system.stateVersion = "24.05";
}
