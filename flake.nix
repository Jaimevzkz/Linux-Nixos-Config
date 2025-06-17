{
  description = "Vzkz's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs-legacy.url = "github:NixOS/nixpkgs/54313579bb0f5b6b5f3657ee776479d2229a03f0";
    #hyprland.url = "github:hyprwm/Hyprland/v0.47.2-b";
  };

  outputs = { self, nixpkgs, ... } @ inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
      legacyPkgs = import inputs.nixpkgs-legacy {
        inherit system;
        config.allowUnfree = true;
      };

    in
    {
      nixosConfigurations = {
        nixos-config = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs system legacyPkgs; };
          modules = [
            ./configuration.nix
          ];
        };
      };
    };
}
