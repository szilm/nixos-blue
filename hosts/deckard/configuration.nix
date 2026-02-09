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

    steam
  ];

  # FIN
  system.stateVersion = "24.11"; # Did you read the comment?
}
