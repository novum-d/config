{ config, pkgs, lib, ... }:

{
  imports = [
    ./programs/git
    # 既存の imports...
  ];

  # X11 関連の設定は Linux の場合のみ適用
  xresources.properties = lib.mkIf pkgs.stdenv.isLinux {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  home.packages = with pkgs; [
    # --- 共通ツール ---
    rustup
    pkg-config
    openssl
    fish neovim ydiff zoxide
    erlang elixir nodejs
    zip unzip xz
    ripgrep fzf zoxide zellij lazygit fd gh ghq tre-command tree-sitter
    httpie python3 ffmpeg graphviz slack
    teams-for-linux
    google-cloud-sdk
    file
    jq
  ]
  ++ (if stdenv.isLinux then [
    # --- Linux 専用 ---
    vscode slack zoom-us 
    anki discord typora
    xdotool xclip xdg-user-dirs albert brave koodo-reader
    gnome-tweaks libreoffice
    pciutils usbutils libinput evtest clang
    android-studio
    jetbrains.rust-rover
    desktop-file-utils
  ] else [
    # --- macOS 専用 (必要であれば) ---
  ]);

  programs.home-manager.enable = true;

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      # パスを環境に合わせて調整
      if test -f $HOME/repos/config/programs/fish/config.fish
          source $HOME/repos/config/programs/fish/config.fish
      end
    '';
    shellInit = "";
    # config.fishを強制上書き
    shellAliases = {};
    loginShellInit = "";
    functions = {};
    plugins = [];
  };

  xdg.configFile."fish/config.fish".force = true;

  programs.java.enable = pkgs.stdenv.isLinux;
  programs.google-chrome.enable = pkgs.stdenv.isLinux; # macOS では Chrome は公式の .dmg が推奨

  # programs.neovim = lib.mkIf pkgs.stdenv.isLinux {
  #   enable = true;
  #   extraPackages = with pkgs; [ elixir erlang ];
  # };

  home.stateVersion = "25.11";
  nixpkgs.config.allowUnfree = true;
}
