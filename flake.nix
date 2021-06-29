{
  description = "My Nix Setup";



  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixos-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur.url = "github:nix-community/NUR";

    LS_COLORS = { url = "github:trapd00r/LS_COLORS"; flake = false; };
  };



  outputs = inputs@{
    self,
    nixpkgs,
    nixos-unstable,
    neovim-nightly,
    home-manager,
    nur,
    LS_COLORS
  }:
    let
      ls-colors-overlay = (final: prev: { inherit LS_COLORS; });
      overlays = [ neovim-nightly.overlay ls-colors-overlay nur.overlay ];
      hmConf = home-manager.lib.homeManagerConfiguration;
      baseWithImports = importsList: { pkgs, ... }: {
        xdg.configFile."nix/nix.conf".source = ./configs/nix/nix.conf;
        nixpkgs.config = import ./configs/nix/config.nix;
        nixpkgs.overlays = overlays;
        imports = importsList;
        # programs.zsh.initExtra = builtins.readFile ./configs/zsh/nixos-desktop_zshrc.zsh;
      };
    in {
      homeConfigurations = {

        # NixOS desktop config
        nixos-desktop = hmConf {
          configuration = baseWithImports (import ./roles/nixos-desktop/modules.nix);
          system = "x86_64-linux";
          homeDirectory = "/home/dot";
          username = "dot";
        };

        # Ubuntu terminal-based config
        ubuntu-server = hmConf {
          configuration = baseWithImports (import ./roles/ubuntu-server/modules.nix);
          system = "x86_64-linux";
          homeDirectory = "/home/dot";
          username = "dot";
        };

        arch-desktop = hmConf {
          configuration = baseWithImports (import ./roles/arch-desktop/modules.nix);
          system = "x86_64-linux";
          homeDirectory = "/home/dot";
          username = "dot";
        };

      };

      nixos-desktop = self.homeConfigurations.nixos-desktop.activationPackage;
      ubuntu-server = self.homeConfigurations.ubuntu-server.activationPackage;
      arch-desktop = self.homeConfigurations.arch-desktop.activationPackage;
    };

}
