# TUI login greeter
{ pkgs, ... }:
{
  services.greetd = {
    enable = true;
    settings = {
      default_session.command = ''
        ${pkgs.tuigreet}/bin/tuigreet \
          --time \
          --asterisks \
          --user-menu \
          --cmd ${pkgs.sway}/bin/sway
      '';
    };
  };

  environment.etc."greetd/environments".text = ''
    sway
  '';
}
