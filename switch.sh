
# Where first arg is directory under machines, can be one of macos, fedora, nixos
nix-shell -p nixUnstable --command "nix build --experimental-features 'nix-command flakes' '.#$1'"
nix build ".#$1" && ./result/activate
