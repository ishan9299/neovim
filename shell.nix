{ pkgs ? import <nixpkgs> { } }:
with pkgs;

mkShell {
  buildInputs = [ gcc-unwrapped ];

}
