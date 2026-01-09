{ pkgs, inputs, ... }:
{
  imports = with inputs.self.nixosModules; [
    ./hardware-configuration.nix

    common
    laptop

    gui
  ];

  # deckard wants swap for hibernate
  boot.resumeDevice = "/dev/disk/by-label/swap";
  swapDevices = [ {
    device = "/dev/disk/by-label/swap";
  } ];

  # deckard wants hibernate, never sleep as it corrupts memory
  services.logind.settings.Login = {
    HandleLidSwitch = "ignore";
    HandlePowerKey = "hibernate";
  };

  # firmware updater
  #services.fwupd.enable = true;

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
