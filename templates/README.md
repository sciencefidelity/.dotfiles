# DevShell Flakes

This collection flakes are used to create DevShells for various programming languages. Use them in conjunction with `direnv` and `nix-direnv`.

Direnv will remind us that we need to run `direnv allow` from inside the directory.

## Notes

### Rust

To use the nightly toolchain use the following inside `buildInputs`:

```nix
(rust-bin.selectLatestNightlyWith (toolchain: toolchain.default.override {
  extensions = [ "miri" "rust-analyzer" "rust-src" ];
}))
```

