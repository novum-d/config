# Configure common options in nixos and darwin
{ pkgs, ... }:
let
  isDarwin = pkgs.stdenv.isDarwin or false;
in
{
  fonts = pkgs.lib.mkIf (!isDarwin) {
    fontDir.enable = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      nerd-fonts.jetbrains-mono
    ];
  };
}
