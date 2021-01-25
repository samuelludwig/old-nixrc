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
    gcc10
    unzip
    ninja
    go
    jdk11
    gopls

    # Files
    #zstd
    #restic

    # System introspection tools
    htop
    wtf
    neofetch

    # Fonts
    inconsolata-nerdfont
  ];

  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "exa --long --classify --all --header --git";
      n = "nvim -O";
      hms = "home-manager switch";
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
