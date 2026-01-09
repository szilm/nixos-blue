### better fonts plus nerd-fonts icons
{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      nerd-fonts.droid-sans-mono
      nerd-fonts.victor-mono

      dejavu_fonts
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
    ];
    fontconfig.defaultFonts = {
      serif = [ "Noto Serif" ];
      sansSerif = [ "Noto Sans" ];
      monospace = [ "VictorMono NF Medium" ];
    };
  };
}
