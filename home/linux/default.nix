{ pkgs, ... }: {

  imports = [
    ../home-manager/home.nix
  ];

  home = {
    username = "novumd";
    homeDirectory = "/home/novumd";

    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;
}
