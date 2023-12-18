{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./programs/wezterm
    ];

  # TODO please change the username & home direcotry to your own
  home.username = "novumd";
  home.homeDirectory = "/home/novumd";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # set cursor size and dpi for 4k monitor
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # here is some command line tools I use frequently
    # feel free to add your own or remove some of them

    # archives
    zip
    unzip
    xz

    # utils
    ripgrep # recursively searches directories for a regex pattern
    fzf # A command-line fuzzy finder
    zoxide
    zellij
    lazygit
    xdg-user-dirs # LANG=C xdg-user-dirs --force
    gh
    ghq
    
    # gui apps
    albert
    discord
    jetbrains-toolbox
    figma-linux 
    gnome.gnome-tweaks
    # input-remapper
    
    # system tools
    pciutils # lspci
    usbutils # lsusb
    libinput
    gcc
  ];

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.neovim.enable = true;
  # programs.fish = {
  #   enable = true;
  #   interactiveShellInit = ''
  #     . $HOME/repos/config/fish/config.fish;
  #   '';
  # };
  programs.git = {
      enable = true;
      lfs.enable = true;
      userName = "novumd";
      userEmail = "hamada.tomoki@email.com";
      aliases = {
          c = "commit";
          co = "checkout";
          p = "pull";
          P = "push";
          s = "status";
          sw = "switch";
          ss = "stash";
      };
      extraConfig = {
         push = { autoSetupRemote = true; };
         ghq.root = "$HOME/repos";
      };
  };

  programs = {
    google-chrome.enable = true;
    brave.enable = true;
  };
}
