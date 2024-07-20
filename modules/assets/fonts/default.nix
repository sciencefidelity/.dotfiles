{ config, pkgs, ... }:

let
  org = config.git.org;
  platform = config.platform;
in
{
  fonts = {
    "${if platform == "darwin" then "fonts" else "packages"}" = [
      (pkgs.stdenv.mkDerivation {
        name = "monolisa";
        src = fetchGit {
          url = "git@github.com:${org}/fonts.git";
          ref = "main";
          rev = "e93e98eccd9eee0e7eb42ee6dfa16d03cfe208ad";
          allRefs = true;
        };
        installPhase = /*bash*/ ''
          mkdir -p $out/share/fonts/truetype
          cp -a $src/monolisa-script/*.ttf $out/share/fonts/truetype
        '';
      })
      (pkgs.nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
    ];
  };
}
