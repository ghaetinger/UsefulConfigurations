{ stdenv, lib, darwin, fetchFromGitHub, rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "kak-lsp";
  version = "9.0.0";

  src = fetchFromGitHub {
    owner = "kak-lsp";
    repo = "kak-lsp";
    rev = "27a765e8c5d415336821fc048dcc3d49ea7ffa29";
    sha256 = "1p6ncsgwrpdygv0blbiavz779r5ar8aczma8mbacf0i8yh0i8d93";
    fetchSubmodules = true;
  };

  cargoSha256 = "0ng5x9gx0ck2xpy0i21274b3psyr1wvxphmp9j5lgxpg4k88377b";

  buildInputs = lib.optional stdenv.isDarwin [ darwin.apple_sdk.frameworks.Security ];

  meta = with lib; {
    description = "Kakoune Language Server Protocol Client";
    homepage = "https://github.com/ul/kak-lsp";
    license = with licenses; [ unlicense /* or */ mit ];
    maintainers = [ maintainers.spacekookie ];
  };
}
