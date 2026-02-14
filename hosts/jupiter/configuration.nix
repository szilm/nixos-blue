### JUPITER
###
### AMD Ryzen 9 3950x

{ pkgs, inputs, ... }:
{
  imports = with inputs.self.nixosModules; [
    ./hardware-configuration.nix

    common
    desktop
    power-ignore
    sshd

    gui
  ];

  console.keyMap = "dvorak";

  # FIN
  system.stateVersion = "25.11"; # installed 2026-02-13
}
