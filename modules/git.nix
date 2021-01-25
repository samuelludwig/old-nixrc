{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    git-lfs
    gitAndTools.delta
    gitAndTools.gh
    gitAndTools.git-crypt
    pre-commit
    lazygit
  ];

  home.file.".config/git/ignore".text = ''
    tags
  '';

  programs.git = {
    enable = true;
    userEmail = "SLudwig.dev@gmail.com";
    userName = "samuelludwig";
  };

}
