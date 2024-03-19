{ config, pkgs, lib, ... }:

{
  options = with lib; with types; {
    root_pass = mkOption { type = str; };
    user = mkOption { type = str; };
    user_pass = mkOption { type = str; };
    org = mkOption { type = str; };
    gh_email = mkOption { type = str; };
  };
  config = {
    root_pass = "$6$7G8if/Rn$wA9X6NWKQ6zsKkz60zowc6tajW78kKwrvu8HX15jJWDgzLrPWcP2nC0b6uY4r10oEMNL/Alor7phV/wWrfbxc.";
    user = "matt";
    user_pass = "$6$IhUfSjtK9Ydj$qnXZYlZ5KD61T4L6bvpaV.5yxTV/7Q8t8WEQCeJ2u40a9PlMZoBGaPCXIBfrAtru8Pu.ZRYm591anUMdKfypH/";
    org = "sciencefidelity";
    gh_email = "32623301+sciencefidelity@users.noreply.github.com";
  };
}
