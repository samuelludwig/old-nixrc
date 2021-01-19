{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    neovim-nightly
    rnix-lsp
    #gopls
  ];
}
