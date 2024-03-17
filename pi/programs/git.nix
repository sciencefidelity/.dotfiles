{ config, pkgs, ... }:

{
  programs.gh = {
    enable = true;
    settings.git_protocol = "ssh";
  };

  programs.git = {
    enable = true;
    aliases = {
      co = "checkout";
      ci = "commit";
      st = "status";
      br = "branch";
      hist = ''log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'';
      type = "cat-file -t";
      dump = "cat-file -p";
    };
    delta = {
      enable = true;
      options = {
        decorations = {
          commit-decoration-style = "bold yellow box ul";
          file-decoration-style = "none";
          file-style = "bold yellow ul";
        };
        features = "decorations";
        whitespace-error-style = "22 reverse";
      };
    };
    extraConfig = {
      init = { defaultBranch = "main"; };
      pull = { rebase = false; };
    };
    signing = {
      key = "0x6D04AAF40371DB76";
      signByDefault = true;
    };
    userName = "sciencefidelity";
    userEmail = "32623301+sciencefidelity@users.noreply.github.com";
  };
}
