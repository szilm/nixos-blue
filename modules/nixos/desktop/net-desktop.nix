### network config for desktops
{ hostName, ... }:
{
  # NetworkManager is nice for wifi with nmtui
  networking = {
    hostName = "${hostName}";
    networkmanager.enable = true;
  };
}
