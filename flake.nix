{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: {
    homeConfigurations = {
      "novumd" = inputs.home-manager.lib.homeManagerConfiguration {
        system = "with x86_64-linux";
        homeDirectory = "/home/novumd";
        username = "novumd";
        configuration.imports = [ ./home.nix ];
      };
    };
  };

}

