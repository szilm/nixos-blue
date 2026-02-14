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

  # firmware updater
  services.fwupd.enable = true;

  # emergency editor
  environment.systemPackages = with pkgs; [
    vim
  ];

  services.joycond.enable = true; # FIXME this doesn't seem to work (with bluetooth)

  users.users.kitty = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "adbusers" "wheel" "audio" ];

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGFERq2UBqlVXV5MniABHPFzV3oEMb75g9z6UgDXnCjd kitty@deckard"
    ];
  };
}
