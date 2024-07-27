# DevShell Flakes

This collection flakes are used to create DevShells for various programming languages. I use them in conjunction with `direnv` and `nix-direnv`.

The to use `direnv` the directory needs a `.envrc` file with the following content:

```bash
use flake
# will load env vars from in a `.env` file.
dotenv
```

Direnv will remind us that we need to run `direnv allow` from inside the directory.

## Notes

### Rust

To use the nightly toolchain use the following inside `buildInputs`:

```nix
(rust-bin.selectLatestNightlyWith (toolchain: toolchain.default.override {
  extensions = [ "miri" "rust-analyzer" "rust-src" ];
}))
```

