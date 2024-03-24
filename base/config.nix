{ lib, ... }:

{
  options = with lib; with types; {
    username = mkOption { type = str; };
    description = mkOption { type = str; };
    password = mkOption { type = str; };
    rootPassword = mkOption { type = str; };
    stateVersion = mkOption { type = str; };
    git = {
      org = mkOption { type = str; };
      email = mkOption { type = str; };
    };
  };
  config = {
    username = "matt";
    description = "Matt Cook";
    password = "$6$IhUfSjtK9Ydj$qnXZYlZ5KD61T4L6bvpaV.5yxTV/7Q8t8WEQCeJ2u40a9PlMZoBGaPCXIBfrAtru8Pu.ZRYm591anUMdKfypH/";
    rootPassword = "$6$7G8if/Rn$wA9X6NWKQ6zsKkz60zowc6tajW78kKwrvu8HX15jJWDgzLrPWcP2nC0b6uY4r10oEMNL/Alor7phV/wWrfbxc.";
    stateVersion = "24.05";
    git = {
      org = "sciencefidelity";
      email = "32623301+sciencefidelity@users.noreply.github.com";
    };
  };
}
