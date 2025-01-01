{
  description = "Home Manager configuration of novumd";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixgl.url = "github:guibou/nixGL";
    nixgl.inputs.nixpkgs.follows = "nixpkgs";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, nixgl, neovim-nightly-overlay, ... }:
    let
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        overlays = [ 
          nixgl.overlay
          neovim-nightly-overlay.overlay
        ];
        config.allowUnfree = true;
      };
    in {
      homeConfigurations."novumd" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./home.nix
        ];
      };
    };
}
