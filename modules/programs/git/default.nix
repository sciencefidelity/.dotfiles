{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      delta
      gh
      lazygit
    ];

    shellAliases = {
      gbr = "git branch";
      gci = "git commit";
      gco = "git checkout";
      gst = "git status";
      lg = "lazygit";
      push = "git push";
      pull = "git fetch origin; git merge origin/main";
    };
  };

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
      key = config.gh_key;
      signByDefault = true;
    };
    userName = config.org;
    userEmail = config.gh_email;
  };
}
