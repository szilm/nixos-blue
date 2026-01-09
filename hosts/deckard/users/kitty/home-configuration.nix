{ pkgs, inputs, ... }:
{
  imports = with inputs.self.homeModules; [
    common
    git

    cli
    sway
  ];

  home.packages = [ pkgs.cowsay ];
  # Defined by /modules/home/me.nix
  # And used all around in /modules/home/*
  me = {
    username = "kitty";
    fullname = "Stuart Zilm";
    email = "stuart.zilm@gmail.com";
  };

  home.stateVersion = "24.11";
}
