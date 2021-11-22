{ pkgs ? import <nixpkgs> {} }:

with pkgs;

let
  inherit (lib) optional optionals;

  elixir = beam.packages.erlangR23.elixir_1_11;
  nodejs = nodejs-14_x;

in

mkShell {
  buildInputs = [ elixir elixir_ls nodejs git postgresql ]
    ++ optional stdenv.isLinux inotify-tools;
}
