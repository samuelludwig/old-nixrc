{
  description = "My Nix Setup";



  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    # inputs.nixos-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    LS_COLORS = { url = "github:trapd00r/LS_COLORS"; flake = false; };
  };



  outputs = inputs@{ self, nixpkgs, neovim-nightly-overlay, home-manager, LS_COLORS }: 
    let
      ls-colors-overlay = (final: prev: { inherit LS_COLORS; });
      overlays = [ neovim-nightly-overlay.overlay ls-colors-overlay ];
      hmConf = home-manager.lib.homeManagerConfiguration;
    in {
      homeConfigurations = {
        nixos-desktop = hmConf {
          configuration = { pkgs, ... }: {
            xdg.configFile."nix/nix.conf".source = ./configs/nix/nix.conf;
            nixpkgs.config = import ./configs/nix/config.nix;
            nixpkgs.overlays = overlays;
            imports = [
              ./modules/home-manager.nix
              #./modules/alacritty.nix
              #./modules/python.nix
              #./modules/neovim.nix
              #./modules/git.nix
              #./modules/media.nix
	      ./modules/packages.nix
            ];
            # programs.zsh.initExtra = builtins.readFile ./configs/zsh/nixos-desktop_zshrc.zsh;
          };
          system = "x86_64-linux";
          homeDirectory = "/home/dot";
          username = "dot";
        };
      };
      nixos-desktop = self.homeConfigurations.nixos-desktop.activationPackage;
    };

}
