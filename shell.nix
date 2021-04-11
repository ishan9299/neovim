{ pkgs ? import <nixpkgs> { }, stdenv }:
with pkgs;
stdenv.mkDerivation {
  name = "neovim";
  buildInputs = [
    gcc
  ];
}
