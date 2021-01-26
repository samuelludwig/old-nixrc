{ conifg, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    alacritty
    libsixel
  ];

  #xdg.configFile."alacritty/alacritty.yml".source = ../configs/terminal/alacritty.yml;

  programs.alacritty = {
    enable = true;
    settings = {
      font.size = 12;
      font.normal.family = "Inconsolata Nerd Font";
      font.bold.family = "Inconsolata Nerd Font";
      font.italic.family = "Inconsolata Nerd Font";
    };
  };

}
