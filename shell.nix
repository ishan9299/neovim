{ pkgs ? import <nixpkgs> { } }:
with pkgs;
stdenv.mkDerivation {
  name = "programming";
  buildInputs = [
    gcc11
    go
    gnumake
    nodejs
  ];
}
