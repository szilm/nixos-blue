{ pkgs, ... }:
{
  # Nix packages to install to $HOME
  home.packages = with pkgs; [
    unzip

    # Unix tools
    bc # for dc
    ripgrep # Better `grep`
    fd sd

    # qol
    lsd
    pv
    # json
    jq
    jo
  ];

  home.shellAliases = {
    ls = "lsd";
    lst = "lsd --tree";
  };

  # Programs natively supported by home-manager.
  # They can be configured in `programs.*` instead of using home.packages.
  programs = {
    fzf.enable = true; # `<ctrl> + r` to fuzzy search shell history
    jq.enable = true;
    btop.enable = true;
  };
}
