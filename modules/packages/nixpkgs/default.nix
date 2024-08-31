{ config, pkgs, inputs, ... }:

let
  platform = config.platform;
in
{
  home = {
    packages = [
      pkgs.bc
      pkgs.fd
      pkgs.jq
      pkgs.lf
      pkgs.lld
      pkgs.neofetch
      pkgs.openssl
      pkgs.pcalc
      pkgs.pkg-config
      pkgs.prettierd
      pkgs.ripgrep
      pkgs.vscode-langservers-extracted

    ] ++ (if platform == "darwin" then [ ]
    else if platform == "linux" then [
      pkgs.lemonade
      pkgs.tcpdump
      pkgs.xclip
      pkgs.xsel
      inputs.rnix.packages.${pkgs.system}.default
    ]
    else [ ]);
  };
}
