############################################################################
# Example nix derivation showing how to customise the packages available
# to the server backend of the HyperHaskell graphical Haskell interpreter.
#
# Install this file with:
#   nix-env -if haskell/hyper-haskell-example.nix
#
# Remember to set the Interpreter Back-end to "nix" in Settings,
# and then Ctrl-R to Reload imports.
#
############################################################################

{ pkgs ? import <nixpkgs> {} }:

pkgs.hyper-haskell.override {
  hyper-haskell-server = pkgs.hyper-haskell-server-with-packages.override {
    packages = self: with self; [
      hyper-extra shell-conduit
    ];
  };
  extra-packages = [ pkgs.cowsay ];
}
