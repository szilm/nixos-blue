{flake, ...}:
{
  xdg.configFile.xkb.source = flake + /assets/dot-config/xkb;
  xdg.configFile.xkb.recursive = true;
}
