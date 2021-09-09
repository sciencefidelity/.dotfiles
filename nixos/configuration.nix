# nix config for Raspberry pi

{ config, pkgs, ... }:

{

  imports =
    [ # the results of the hardware scan, do not change
      ./hardware-configuration.nix
    ];

  boot.loader.raspberryPi = {
    enable = true;
    version = 4;
  };
  boot.loader.grub.enable = false;
  boot.loader.generic-extlinux-compatible.enable = true;

  hardware.enableRedistributableFirmware = true;

  networking = {
    hostName = "pi";
    wireless = {
      enable = true;
    };
  };

  users = {
    defaultUserShell = pkgs.zsh;
    mutableUsers = false;
    users.matt = {
      isNormalUser = true;
      home = "/home/matt";
      description = "Matt Cook";
      extraGroups = [ "wheel" ]; # enable ‘sudo’ for the user
      openssh.authorizedKeys.keys =
        let keys = import /home/matt/.ssh/keys.nix;
        in [ keys.matt ];
    };
  };

  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";

  environment.systemPackages = with pkgs; [
    abduco
    bat
    cabal-install
    deno
    dart
    elmPackages.create-elm-app
    elmPackages.elm
    elmPackages.elm-analyse
    elmPackages.elm-format
    elmPackages.elm-language-server
    elmPackages.elm-live
    elmPackages.elm-review
    elmPackages.elm-test
    emacs
    exa
    fd
    fzf
    libraspberrypi
    lua
    luajit
    luarocks
    ghc
    git
    go
    gopls
    lazygit
    lf
    mosh
    neovim
    nodejs
    nodePackages.esy
    nodePackages.gatsby-cli
    nodePackages.svelte-language-server
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.vue-cli
    nodePackages.vue-language-server
    nodePackages.yarn
    ocamlPackages.js_of_ocaml
    ocamlPackages.js_of_ocaml-ppx
    ocamlPackages.js_of_ocaml-lwt
    raspberrypi-eeprom
    ripgrep
    samba
    sumneko-lua-language-server
    tmux
    wget
    zsh
  ];

  environment.variables = {
    EDITOR = "nvim";
    KEYTIMEOUT = 1;
    VISUAL = "$EDITOR";
    BAT_THEME = "Dracula";
  };

  services.openssh.enable = true;

  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      update = "sudo nixos-rebuild switch";
      # https://the.exa.website/docs/command-line-options
      ls="exa -F --group-directories-first";
      l="exa -aF --group-directories-first";
      la="exa -laF --group-directories-first --git --git-ignore";
      ll="exa -lF --group-directories-first --git --git-ignore";
      lt="exa -T --git-ignore";
      lr="exa -R --git-ignore";

      ..="cd ..";
      ...="cd ../..";
      ....="cd ../../..";
      .....="cd ../../../..";
      mkdir="mkdir -p";
      # for more human readable results
      df="df -kTh";
      free="free -h";
      du="du -h -c"; # calculate disk usage for a folder
      # https://github.com/sharkdp/bat
      cat="bat";
      # https://github.com/BurntSushi/ripgrep
      grep="grep --color=auto";
      grep="rg";
      # https://github.com/sharkdp/fd
      fd="fdfind";
      # always use Neovim
      vi="nvim";
      vim="nvim";

      push="eval '$(ssh-agent -s)'; ssh-add ~/.ssh/github; git push";
      pull="eval '$(ssh-agent -s)'; ssh-add ~/.ssh/github; git fetch origin; git merge origin/main";
      gst="git status";
      # prevent typing password too often
      sudo="sudo -v; sudo ";
      # recursively delete `.DS_Store` files
      cleanup="find . -name '*.DS_Store' -type f -ls -delete";
    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    # https://github.com/zplug/zplug
    zplug = {
      enable = true;
      plugins = [
        # https://github.com/dracula/zsh
        { name = "dracula/zsh"; tags = [ as:theme ]; }
        # https://github.com/zsh-users/zsh-autosuggestions
        { name = "zsh-users/zsh-autosuggestions"; }
        # https://github.com/zsh-users/zsh-syntax-highlighting
        { name = "zsh-users/zsh-syntax-highlighting"; }
        # https://github.com/spaceship-prompt/spaceship-prompt
        { name = "spaceship-prompt/spaceship-prompt"; tags = [ use:spaceship.zsh from:github as:theme ]; }
      ];
    };
  };

  system.stateVersion = "21.11";

}
