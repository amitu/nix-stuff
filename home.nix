{ config, pkgs, ... }:
with pkgs;
{
  home.packages = [
    htop
    nixpkgs-fmt
    curl
    wget
    zsh
    direnv
  ];
  programs.home-manager.enable = true;
}
