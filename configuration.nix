{
  inputs,
  config,
  pkgs,
  ...
}: {
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
#  programs.hyprland = {
#    enable = true;
#    xwayland.enable = true;
#  };
#  programs.waybar.enable = true;
#  xdg.portal.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes"];

  fonts.packages = with pkgs; [
    fira-code-nerdfont
  ];

  networking.hostName = "nixos";

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
	# Util
	gcc
	git
	pamixer #volume control
	brightnessctl
	grim
	slurp
	unzip
	android-tools
	scrot
	xclip
	maim
	libnotify

	# Terminal
	vim
	neovim
	neofetch
	htop
	eza
	zoxide
	alacritty
	zsh
	starship
	tmux
	lazygit
	cmatrix

	# Apps
	signal-desktop
	home-manager
	discord
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
	dunst #Notification daemon

	# Hyprland
#	waybar
#	libnotify
#	hyprpaper #Wallpaper daemon
#	rofi-wayland
#	networkmanagerapplet
#	dolphin
#	jq
#	hyprlock
#	hypridle
#	clipman
  ];

  users.users = {
    vzkz = {
   	 isNormalUser = true;
   	 description = "Jaime";
   	 extraGroups = [ "networkmanager" "wheel" "docker" ];
   	 packages = with pkgs; [
   		 #  thunderbird
   	 ];
	shell = pkgs.zsh;
	};
  };
  #enable zsh and set it as default
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  # Swaylock
  #programs.sway.enable = true;

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
    LC_ADDRESS = "es_ES.UTF-8";
    LC_IDENTIFICATION = "es_ES.UTF-8";
    LC_MEASUREMENT = "es_ES.UTF-8";
    LC_MONETARY = "es_ES.UTF-8";
    LC_NAME = "es_ES.UTF-8";
    LC_NUMERIC = "es_ES.UTF-8";
    LC_PAPER = "es_ES.UTF-8";
    LC_TELEPHONE = "es_ES.UTF-8";
    LC_TIME = "es_ES.UTF-8";
  };

  
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "intl";
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
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # This setups a SSH server. Very important if you're setting up a headless system.
  # Feel free to remove if you don't need it.
  services.openssh = {
    enable = true;
    settings = {
      # Opinionated: forbid root login through SSH.
      PermitRootLogin = "no";
      # Opinionated: use keys only.
      # Remove if you want to SSH using passwords
      PasswordAuthentication = false;
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}
