{ config, lib, pkgs, ... }:

let
  org = config.git.org;
  platform = config.platform;
in
{
  fonts = {
    "${if platform == "darwin" then "fonts" else "packages"}" = with pkgs; [
      (stdenv.mkDerivation {
        name = "monolisa";
        src = fetchGit {
          url = "git@github.com:${org}/fonts.git";
          ref = "main";
          rev = "4a073ee4f2919c891fc3bb4f4d237aab9c2d419b";
        };
        installPhase = /*bash*/ ''
          mkdir -p $out/share/fonts/truetype
          cp -a $src/monolisa-script/*.ttf $out/share/fonts/truetype
        '';
      })
      (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
    ];
  };
}
