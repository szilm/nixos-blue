### DECKARD
###
### HP 227H4UP#ABA EliteBook 830 G7
### S/N 5GC10383D0
{ pkgs, inputs, ... }:
{
  imports = with inputs.self.nixosModules; [
    ./hardware-configuration.nix

    common
    laptop
    power-hibernate # depends on swap at /dev/disk/by-label/swap

    gui
  ];

  # firmware updater
  services.fwupd.enable = true;

  # emergency editor
  environment.systemPackages = with pkgs; [
    vim
  ];

  services.joycond.enable = true; # FIXME this doesn't seem to work (with bluetooth)

  users.users.kitty = { # TODO DRY this?
    isNormalUser = true;
    extraGroups = [ "networkmanager" "adbusers" "wheel" ];
  };

  # FIN
  system.stateVersion = "24.11"; # Did you read the comment?
}
