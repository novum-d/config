{
  description = "NixOS configuration of novumd";

  inputs = {
    home-manager.url = "github:nix-community/home-manager";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
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
        ];
      };
    };
    darwinConfigurations = {
      "t-hamada-5393" = nix-darwin.lib.darwinSystem {
        modules = [
          ({ pkgs, ... }: {
            system.primaryUser = "t.hamada";
            users.users."t.hamada" = {
              name = "t.hamada";
              home = "/Users/t.hamada";
              shell = pkgs.fish;
            };
            programs.fish.enable = true;
            homebrew = {
              enable = true;
              onActivation.cleanup = "zap";
              brews = [ "mas" ];
              casks = [
                "google-chrome"
                "visual-studio-code"
                "slack"
                "jetbrains-toolbox"
                "wezterm"
                "google-japanese-ime"
                "clipy"
                "figma"
                "charles"
              ];
            };
            nixpkgs.config.allowUnfree = true;
            environment.systemPackages = [ pkgs.vim ];
            nix.settings.experimental-features = "nix-command flakes";
            ids.gids.nixbld = 30000;
            system.configurationRevision = self.rev or self.dirtyRev or null;
            system.stateVersion = 6;
            nixpkgs.hostPlatform = "aarch64-darwin";
          })
          home-manager.darwinModules.home-manager
        ];
      };
    };
    homeConfigurations = {
      "novumd@nixos" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { system = "x86_64-linux"; };
        extraSpecialArgs = { inherit inputs; };
        modules = [ ./home.nix ];
        username = "novumd";
        homeDirectory = "/home/novumd";
        stateVersion = "25.11";
      };
      "t.hamada@t-hamada-5393" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { system = "aarch64-darwin"; };
        extraSpecialArgs = { inherit inputs; };
        modules = [ ./home.nix ];
        username = "t.hamada";
        homeDirectory = "/Users/t.hamada";
        stateVersion = "25.11";
      };
    };
  };
}
