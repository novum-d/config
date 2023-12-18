{ config, pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "novumd";
  home.homeDirectory = "/home/novumd";

  # This value determines the Home Manager release that your configuration is # compatible with. This helps avoid breakage when a new Home Manager release # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # pkgs.nixgl.auto.nixGLDefault
    
    # Fonts
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
    nerdfonts
    jetbrains-mono
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    
    # Shell
    fd
    zoxide
    lazygit
    timeshift

    # Programming Languages
    rustup

    # GUI Applications
    albert
    discord
    jetbrains-toolbox
    figma-linux
    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/novumd/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.fzf.enable = true;
  programs.git.enable = true;
  programs.gh.enable = true;
  programs.neovim.enable = true;
  programs.zoxide.enable = true;
  programs.ripgrep.enable = true;
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      . $HOME/config/fish/config.fish;
    '';
  };
  imports = [
    ./wezterm.nix
    ./browser.nix
  ];
}
