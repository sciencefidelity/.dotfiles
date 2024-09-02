{
  description = "Matt's flake templates";

  outputs = { self, ... }: {
    templates = {
      rust = {
        path = ./rust;
        description = "A Rust template";
        welcomeText = ''
          Nothing in this world is difficult, it is only our thoughts that make is seem so.
        '';
      };
    };
    templates.default = self.templates.rust;
  };
}
