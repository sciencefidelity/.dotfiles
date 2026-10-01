{ lib, pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      bc
      fd
      jq
      lf
      lld
      fastfetch
      opencode
      openssl
      pkg-config
      prettierd
      ripgrep
      vscode-langservers-extracted
      tree-sitter
    ] ++ lib.optionals stdenv.hostPlatform.isLinux [
      lemonade
      tcpdump
      tshark
      xclip
      xsel
    ];
  };
}
