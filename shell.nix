{ pkgs ? import <nixpkgs> { } }:
with pkgs;

mkShell {
  buildInputs = [
    git
    gcc-unwrapped
    tree-sitter
    ninja
  ];
}
