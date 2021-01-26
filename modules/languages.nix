
{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    # Go
    go
    gopls

    # C
    gcc10

    # Java
    jdk11
  ];
}
