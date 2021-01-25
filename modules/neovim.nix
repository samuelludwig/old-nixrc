{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    neovim-nightly
    rnix-lsp
    #gopls
  ];

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
    extraConfig = builtins.readFile ../configs/neovim/init.vim;
  };
}
