{
  description = "may's NixOS + Home Manager config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-26.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Declarative Neovim configuration (see home/neovim.nix)
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  } @ inputs: {
    # Named after networking.hostName, so `nixos-rebuild --flake ~/dotfiles`
    # picks it automatically. The CPU architecture comes from
    # hardware-configuration.nix.
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;}; # `inputs` inside nixos/*.nix

      modules = [
        ./nixos/configuration.nix

        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "backup";
            extraSpecialArgs = {inherit inputs;}; # `inputs` inside home/*.nix
            users.may = import ./home;
          };
        }
      ];
    };
  };
}
