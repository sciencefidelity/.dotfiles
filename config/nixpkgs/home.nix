{ pkgs, ... }:

{
#  home.username = "$USER";
#  home.homeDirectory = "$HOME";

  programs.git = {
    enable = true;
    userName = "sciencefidelity";
    userEmail = "32623301+sciencefidelity@users.noreply.github.com";
   
    signing = {
      key = "9F071448877E6705";
      signByDefault = true;
    };

    aliases = {
      co = "checkout";
      ci = "commit";
      st = "status";
      br = "branch";
      hist = "log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short";
      type = "cat-file -t";
      dump = "cat-file -p";
    };
  };

  programs.emacs = {
    enable = true;
#    extraConfig = ''
#      source ${/home/matt/dotfiles/config/emacs.d/init.el}
#    '';
    extraPackages = epkgs: [
      epkgs.company
      epkgs.counsel
      epkgs.diminish
      epkgs.dracula-theme
      epkgs.editorconfig
      epkgs.evil
      epkgs.evil-nerd-commenter
      epkgs.helpful
      epkgs.ivy
      epkgs.ivy-rich
      epkgs.lsp-mode
      epkgs.magit
      epkgs.rainbow-delimiters
      epkgs.smartparens
      epkgs.treemacs
      epkgs.treemacs-magit
      epkgs.typescript-mode
      epkgs.use-package
      epkgs.which-key
    ];
  };
}


