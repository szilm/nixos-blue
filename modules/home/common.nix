### Common to all home-manager configs FIXME what context do we return to?

{ pkgs, inputs, osConfig, ... }:
{
  imports = with inputs.self.homeModules; [ me git nix-index ];
  # TODO this is from template, enable or delete?
  # only available on linux, disabled on macos
  #services.ssh-agent.enable = pkgs.stdenv.isLinux;

  # home.packages = with pkgs;
  #   [ ripgrep ];

  home.stateVersion = "24.11"; # initial home-manager state
}
