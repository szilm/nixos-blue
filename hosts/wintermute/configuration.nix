{ pkgs, inputs, ... }:
{
  imports = with inputs.self.nixosModules; [
    ./hardware-configuration.nix

    common
    laptop

    gui
  ];

  # wintermute has two GPUs, causing jank with nouveau
  boot.blacklistedKernelModules =
      [
        "nouveau"
      ];

  services.logind.settings.Login = {
    HandleLidSwitch = "sleep";
    HandlePowerKey = "sleep";
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
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # FIN
  system.stateVersion = "25.05"; # Did you read the comment?
}
