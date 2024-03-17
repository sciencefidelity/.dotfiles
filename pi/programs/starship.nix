{ config, lib, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;

      format = lib.concatStrings [
        "$username"
        "$shlvl"
        "$singularity"
        "$kubernetes"
        "$directory"
        "$hostname"
        "$vcsh"
        "$git_branch"
        "$git_commit"
        "$git_state"
        "$git_metrics"
        "$git_status"
        "$hg_branch"
        "$docker_context"
        "$package"
        "$cmake"
        "$cobol"
        "$dart"
        "$deno"
        "$dotnet"
        "$elixir"
        "$elm"
        "$erlang"
        "$golang"
        "$helm"
        "$java"
        "$julia"
        "$kotlin"
        "$lua"
        "$nim"
        "$nodejs"
        "$ocaml"
        "$perl"
        "$php"
        "$pulumi"
        "$purescript"
        "$python"
        "$rlang"
        "$red"
        "$ruby"
        "$rust"
        "$scala"
        "$swift"
        "$terraform"
        "$vlang"
        "$vagrant"
        "$zig"
        "$nix_shell"
        "$conda"
        "$memory_usage"
        "$aws"
        "$gcloud"
        "$openstack"
        "$env_var"
        "$crystal"
        "$custom"
        "$cmd_duration"
        "$line_break"
        "$jobs"
        "$battery"
        "$time"
        "$status"
        "$shell"
        "$character"
      ];

      aws.disabled = true;
      battery.disabled = true;
      cmake.disabled = true;
      conda.disabled = true;
      crystal.disabled = true;
      docker_context.disabled = true;
      dotnet.disabled = true;
      helm.disabled = true;
      julia.disabled = true;
      hg_branch.disabled = true;
      openstack.disabled = true;
      perl.disabled = true;
      php.disabled = true;
      rlang.disabled = true;
      red.disabled = true;
      ruby.disabled = true;
      scala.disabled = true;
      singularity.disabled = true;
      terraform.disabled = true;
      vagrant.disabled = true;
      vlang.disabled = true;
      vcsh.disabled = true;

      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
        vicmd_symbol = "[➜](bold purple)";
      };

      directory = { format = "in [$path](bold cyan) "; };

      hostname = {
        ssh_only = false;
        format = "on [$hostname](bold blue) ";
        trim_at = ".";
        disabled = false;
      };

      nodejs = { symbol = "🐢 "; };

      package = { format = "is [$version](bold red) "; };

      username = {
        style_user = "yellow bold";
        style_root = "red bold";
        format = "[$user]($style) ";
        disabled = false;
        show_always = true;
      };
    };
  };
}
