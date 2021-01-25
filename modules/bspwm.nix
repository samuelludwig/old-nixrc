{ config, pkgs, libs, ... }:

{
  home.packages = with pkgs; [
    bspwm
    nitrogen
    sxhkd
  ];

  home.file = {
    ".config/sxhkd/sxhkdrc".source = ../configs/sxhkd/sxhkdrc;
    ".config/bspwm/bspwmrc".source = ../configs/bspwm/bspwmrc;
  };

}
