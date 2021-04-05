{ pkgs ? import <nixpkgs> {} }:


pkgs.stdenv.mkDerivation rec {
  pname = "tufte-article";
  src = pkgs.fetchFromGitHub {
    owner = "sylvain-kern";
    repo = "tufte-style-article";
    rev = "742e0181d062e8fa7adae95e5dfe8791b2d132ef";
    sha256 = "07c9gbakcdfx2ya4bnddqjm6xfl20731raajly8ifxpqvsvh9rvr";
      fetchSubmodules = true;
  };

  installPhase = ''
    echo $out
    mkdir -p $out/tex/latex
    cp ./tufte-style-article.cls $out/tex/latex
  '';

  tlType = "run";
  name = pname;
}
