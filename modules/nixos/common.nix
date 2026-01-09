### Common to all nixosConfigurations.<hostname>

{ pkgs, hostName, ... }:
{
  nix.settings.experimental-features = "nix-command flakes";

  time.timeZone = "Canada/Pacific";
  i18n.defaultLocale = "en_CA.UTF-8"; # TODO install CA locale
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };
}
