### WINTERMUTE
###
### HP 15-bl108ca Spectre x360
### S/N 5CD7460922

{ pkgs, inputs, ... }:
{
  imports = with inputs.self.nixosModules; [
    ./hardware-configuration.nix

    common
    laptop
    power-sleep

    gui
  ];

  # wintermute has two GPUs, causing jank with nouveau
  boot.blacklistedKernelModules =
      [
        "nouveau"
      ];

  # FIN
  system.stateVersion = "25.05"; # Did you read the comment?
}
