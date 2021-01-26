{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    # Oxidized coreutils
    exa
    bat
    tokei
    xsv
    fd
    ripgrep

    # Development tools
    tmux
    jq
    unzip
    ninja

    # System introspection tools
    htop
    wtf
    neofetch
  ];

  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "exa --long --classify --all --header --git";
      n = "nvim -O";
      hms = "home-manager switch";
      gs = "git status"
      ga = "git add"
      gc = "git commit"
    };
    initExtra = ''
      gu() {
        git add .
        git commit -m "$1"
        git push
      }
    '';
  };
}
