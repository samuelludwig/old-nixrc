{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    # Chat apps
    discord
    tdesktop # Telegram Desktop Client

    # Reader
    zathura
  ];
}
