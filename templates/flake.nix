{
  description = "Matt's flake templates";

  outputs = { self, ... }: {
    templates = {
      bun = {
        path = ./bun;
        description = "A Bun template";
        welcomeText = ''
          Nothing in this world is difficult, it is only our thoughts that make is seem so.
        '';
      };
      clojure = {
        path = ./clojure;
        description = "A Clojure template";
        welcomeText = ''
          Nothing in this world is difficult, it is only our thoughts that make is seem so.
        '';
      };
      elixir = {
        path = ./elixir;
        description = "An Elixir template";
        welcomeText = ''
          Nothing in this world is difficult, it is only our thoughts that make is seem so.
        '';
      };
      empty = {
        path = ./empty;
        description = "An empty template";
        welcomeText = ''
          Nothing in this world is difficult, it is only our thoughts that make is seem so.
        '';
      };
      go = {
        path = ./go;
        description = "A Go template";
        welcomeText = ''
          Nothing in this world is difficult, it is only our thoughts that make is seem so.
        '';
      };
      node = {
        path = ./node;
        description = "A Node template";
        welcomeText = ''
          Nothing in this world is difficult, it is only our thoughts that make is seem so.
        '';
      };
      python = {
        path = ./python;
        description = "A Python template";
        welcomeText = ''
          Nothing in this world is difficult, it is only our thoughts that make is seem so.
        '';
      };
      rust = {
        path = ./rust;
        description = "A Rust template";
        welcomeText = ''
          Nothing in this world is difficult, it is only our thoughts that make is seem so.
        '';
      };
      svelte = {
        path = ./svelte;
        description = "A Svelte template";
        welcomeText = ''
          Nothing in this world is difficult, it is only our thoughts that make is seem so.
        '';
      };
      terraform = {
        path = ./terraform;
        description = "A Terraform template";
        welcomeText = ''
          Nothing in this world is difficult, it is only our thoughts that make is seem so.
        '';
      };
      zig = {
        path = ./zig;
        description = "A Zig template";
        welcomeText = ''
          Nothing in this world is difficult, it is only our thoughts that make is seem so.
        '';
      };
    };
    templates.default = self.templates.empty;
  };
}
