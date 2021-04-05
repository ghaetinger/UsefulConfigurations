with import <nixpkgs> { };
stdenv.mkDerivation {
     name = "my dropbox hook";
     buildInputs = [ dropbox-cli ];
     shellHook = ''
     dropbox start
     '';
   }
