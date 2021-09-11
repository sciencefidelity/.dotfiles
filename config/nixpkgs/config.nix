{
  packageOverrides = pkgs: with pkgs; rec {
    myEmacsConfig = writeText "default.el" ''
      source ${/home/matt/dotfiles/config/emacs.d/init.el}
    '';
    myEmacs = emacs.pkgs.withPackages (epkgs: (with epkgs.melpaStablePackages; [
      (runCommand "default.el" {} ''
        mkdir -p $out/share/emacs/site-lisp
        cp ${myEmacsConfig} $out/share/emacs/site-lisp/default.el
      '')
      company
      counsel
      diminish
      dracula-theme
      editorconfig
#      eterm-256color
      evil
      evil-nerd-commenter
      helpful
#      highlight-indent-guides
      ivy
      ivy-rich
      lsp-mode
      magit
#      powerline-evil
      rainbow-delimiters
      smartparens
      treemacs
      treemacs-magit
      typescript-mode
      use-package
      which-key
    ]));
  };
}
