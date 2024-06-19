{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      bunyan-rs
      cargo-audit
      cargo-expand
      cargo-tarpaulin
      cargo-udeps
      sqlx-cli
      (pkgs.rust-bin.selectLatestNightlyWith (toolchain: toolchain.default.override {
        extensions = [ "rustfmt" "rust-analyzer" "rust-src" "miri" ];
      }))
    ];

    # file = {
    #   config = {
    #     enable = true;
    #     target = ".cargo/config.toml";
    #     text = ''
    #       [target.x86_64-unknown-linux-gnu]
    #       rustflags = ["-C", "linker=clang", "-C", "link-arg=-fuse-ld=lld"]
    #
    #       [target.aarch64-unknown-linux-gnu]
    #       rustflags = ["-C", "linker=clang", "-C", "link-arg=-fuse-ld=lld"]
    #
    #       [target.aarch64-apple-darwin]
    #       rustflags = ["-C", "link-arg=-fuse-ld=lld"]
    #     '';
    #   };
    # };
  };

  programs.zsh = {
    initExtra = ''
      # cn = cargo new <app-name>
      cn() { cargo new --bin "$@" && cd "$@"; }
    '';
  };

  programs.neovim = {
    extraLuaConfig = ''
      ${builtins.readFile ./rust.lua}
      ${builtins.readFile ./snippets.lua}
    '';
  };
}
