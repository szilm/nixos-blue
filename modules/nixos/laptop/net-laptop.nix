### network config for laptops
{ hostName, ... }:
{
  # NetworkManager is nice for wifi with nmtui
  networking = {
    hostName = "${hostName}";
    networkmanager.enable = true;
  };
  # systemd-networkd manages usb tethering interface ignored by NetworkManager
  systemd.network = {
    enable = true;
    wait-online.enable = false;

    networks."50-wwan-tether" = {
      matchConfig.Name = "wwp0*";
      networkConfig.DHCP = "ipv4";
      linkConfig.RequiredForOnline = "no";
      dhcpV4Config.RouteMetric = 512;
    };
  };
}
