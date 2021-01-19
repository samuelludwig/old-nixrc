{ config, pkgs, libs, ... }:
{
  home.stateVersion = "21.03";

  programs.man.enable = false;
  home.extraOutputsToInstall = [ "man" ];
}
