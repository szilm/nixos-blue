### standard boot options across all hosts
{ pkgs, ... }:
{
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;

    kernelPackages = pkgs.linuxPackages_latest; # run a recent kernel

    crashDump.enable = true; # logs kernel panics
    kernel.sysctl."kernel.sysrq" = 1; # magic SysRq
  };
}
