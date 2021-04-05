
{ pkgs ? import <nixpkgs> { } }:
with pkgs;

let
  home = "/home/dewey";
  misc_dir = "/home/dewey/Misc";
in stdenv.mkDerivation rec {
  name = "my_polybar";
  src = fetchFromGitHub {
    owner = "adi1090x";
    repo = "polybar-themes";
    rev = "46154c5283861a6f0a440363d82c4febead3c818";
    sha256 = "0lp1sqxzbc0w9df5jm0h7bkcdf94ahf4929vmf14y7yhbfy2llf3";
    fetchSubmodules = true;
  };
  buildInputs = [
    polybar
  ];

  buildPhase = ''
  '';

  installPhase = ''
     chmod +x ./setup.sh
     mkdir ${misc_dir}/polybar_misc
     mv * ${misc_dir}/polybar_misc
     cd ${misc_dir}/polybar_misc
     yes "1" | bash ./setup.sh
  '';
}
