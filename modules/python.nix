{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    #poetry
    #(python3.withPackages (ps: with ps; [ pip ]))
    python3
  ];
}
