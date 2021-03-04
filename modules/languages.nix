
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
    lua5_1
    lua5_1Packages.busted
    lua5_1Packages.luarocks
    luajit
    luajitPackages.busted
    luajitPackages.luarocks
  ];
}
