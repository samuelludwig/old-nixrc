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
    git-crypt
    gcc10
    python3
    unzip
    ninja
    go
    jdk11
    gopls
    lazygit

    # Files
    #zstd
    #restic

    # Media
    discord
    firefox

    # System introspection tools
    htop
    wtf
    neofetch

    # Fonts
    inconsolata-nerdfont
  ];

  programs.git = {
    enable = true;
    userEmail = "SLudwig.dev@gmail.com";
    userName = "samuelludwig";
  };

  programs.alacritty = {
    enable = true;
    settings = {
      font.size = 16;
      font.normal.family = "Inconsolata Nerd Font";
      font.bold.family = "Inconsolata Nerd Font";
      font.italic.family = "Inconsolata Nerd Font";
    };
  };

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
    extraConfig = builtins.readFile ../configs/nvim/init.vim;
  };

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
