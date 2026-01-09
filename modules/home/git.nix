{ config, ... }:
{
  home.shellAliases = {
    g = "git";
  };

  programs = {
    git = {
      enable = true;
      settings = {
        user.name = config.me.fullname;
        user.email = config.me.email;

        alias = {
          # ci = commit;
        };
      };
      ignores = [ "*~" "*.swp" ];
    };
  };
}
