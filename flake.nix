{
  description = "NixOS configuration of novumd";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, nix-darwin, ... }:
  {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            # Home Manager ユーザ設定
            home-manager.users.novumd = import ./home.nix;
          }
        ];
      };
    };
    darwinConfigurations = {
      "t-hamada-5393" = nix-darwin.lib.darwinSystem {
        modules = [
          ({ pkgs, ... }: {
            environment.systemPackages = [ pkgs.vim ];
            nix.settings.experimental-features = "nix-command flakes";
            ids.gids.nixbld = 30000;
            # programs.fish.enable = true;
            system.configurationRevision = self.rev or self.dirtyRev or null;
            system.stateVersion = 6;
            nixpkgs.hostPlatform = "aarch64-darwin";
          })
        ];
      };
    };
  };
}
