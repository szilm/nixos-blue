{ pkgs, ... }:
{
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
  security.polkit.enable = true; # for sway in Home Manager
  hardware.graphics.enable = true;

  environment.systemPackages = with pkgs; [
    wl-clipboard # clipboard
    mako # notifications
  ];
}
