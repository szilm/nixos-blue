### Provides a favourable shell environment
{ pkgs, flake, ... }:
{
  programs = {
    bash = { # TODO: bash by default for compatability?
      enable = true;
      initExtra = ''
        # Custom bash profile goes here
      '';
    };

    fish = {
      enable = true;
      functions = {
        __last_history_item = {
          body = "echo $history[1]";
        };
        q = { body = "exit"; };
        fuzzel-ask-p = {
          argumentNames = "ask yes no";
          body = ''
            function _longest
                math max\((string length $argv | string join ',')\)
            end
            set width (_longest $ask $yes $no)

            set choice (string join0 $yes $no | fuzzel --dmenu0 --index --minimal-lines --width $width --prompt $ask)

            if test $choice = 0
                return 0
            end

            return 1
          '';
        };
      };
      shellAbbrs = {
        "!!" = {
          position = "anywhere";
          function = "__last_history_item";
        };
      };
      shellAliases = {
        # less = "nvimpager";
      };
      interactiveShellInit = ''
        fish_vi_key_bindings
      '';
    };

    nushell = {
      enable = true;
    };

    # Type `z <pat>` to cd to some directory
    zoxide.enable = true;

    # Fancy shell prompt
    starship = {
      enable = true;
      # import TOML for preset and merge with settings
      settings = pkgs.lib.importTOML (flake + /assets/starship-preset-tokyo-night.toml) // {
        username = {
          style_user = "blue bold";
          style_root = "red bold";
          format = "[$user]($style) ";
          disabled = false;
          show_always = true;
        };
        hostname = {
          ssh_only = false;
          ssh_symbol = "🌐 ";
          format = "on [$hostname](bold red) ";
          trim_at = ".local";
          disabled = false;
        };
      };
    };
  };
}
