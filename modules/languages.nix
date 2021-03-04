
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

    # PHP
    php74

    # Lua
    luajit
    luajitPackages.busted
    luajitPackages.luarocks
  ];
}
