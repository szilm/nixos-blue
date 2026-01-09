{
  # swap required for hibernate
  boot.resumeDevice = "/dev/disk/by-label/swap";
  swapDevices = [ {
    device = "/dev/disk/by-label/swap";
  } ];

  services.logind.settings.Login = {
    HandleLidSwitch = "ignore";
    HandlePowerKey = "hibernate";
  };
}
