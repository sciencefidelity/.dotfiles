{
  description = "Matt's flake templates";

  outputs = { self, ... }: {
    templates = {
      empty = {
        path = ./empty;
        description = "An empty template";
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
      terraform = {
        path = ./terraform;
        description = "A Terraform template";
        welcomeText = ''
          Nothing in this world is difficult, it is only our thoughts that make is seem so.
        '';
      };
    };
    templates.default = self.templates.empty;
  };
}
