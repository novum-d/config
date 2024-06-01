
# Configure common options in nixos and darwin
{ pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "novum-d";
    userEmail = "hamada.tomoki01@gmail.com";

    # includes = [
    #   { path = "~/.gitlocalconfig"; }
    # ];

    aliases = {
      a = "add";
      b = "branch -vv";
      d = "diff";
      st = "status";
      s = "statsh -u";
      pop = "statsh pop";
      l = "log";
      p = "pull";
      P = "push";

      co = "checkout";
      c = "commit";
      sw = "switch";
    };

    extraConfig = {
      push = { autoSetupRemote = true; };
    };
  };

  home.packages = with pkgs; [
    git-trim
  ];
}
