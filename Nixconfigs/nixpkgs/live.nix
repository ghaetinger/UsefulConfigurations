with import <nixpkgs> {config={allowUnfree = true;};};
vscode-with-extensions.override {vscodeExtensions = with vscode-extensions; [ms-vsliveshare.vsliveshare];}
