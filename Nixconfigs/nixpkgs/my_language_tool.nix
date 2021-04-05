{ pkgs ? import <nixpkgs> { } }:
with pkgs;
stdenv.mkDerivation rec {
  name = "my_langtools_with_dependencies";
  src = languagetool;
  buildInputs = [
    jdk11
  ];
}
