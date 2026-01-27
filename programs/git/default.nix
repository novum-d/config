
# Configure common options in nixos and darwin
{ pkgs, ... }:
{
  programs.git = {
    enable = true;

    # includes = [
    #   { path = "~/.gitlocalconfig"; }
    # ];
    lfs.enable = true;

    settings = {
      user.name = "novum-d";
      user.email = "hamada.tomoki01@gmail.com";
      push = { autoSetupRemote = true; };
      ghq = { root = "~/repos"; };
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
    };
  };

  home.packages = with pkgs; [
    git-trim
  ];
}
