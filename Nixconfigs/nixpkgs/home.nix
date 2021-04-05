{ config, lib, pkgs, runCommand, ... }:

let

  unstable = import <nixpkgs-unstable> { config = { allowUnfree = true; }; };
  my_kak_lsp = pkgs.callPackage ./kak-lsp.nix {};

  system_pkgs = with pkgs; [
    dmenu
    kitty
    fish
    starship
    docker
    libsecret
    dropbox-cli
  ];

  interface_pkgs = with pkgs; [
    picom
    nitrogen
    xmobar
    # polybar
    # xdo
    # xorg.xwininfo
  ];

  gui_applications = with pkgs; [
    zathura
    google-chrome
    unstable.discord
    spotify
    flameshot
    vlc
    blender
    unstable.mailspring
    unstable.albert
    dolphin
    emacs
    unstable.vscode
  ];

  cli_applications = with pkgs; [
    htop
    kakoune
    unzip
    fzf
    ripgrep
    sqlite
    fortune
  ];

  writing_tools = with pkgs; [
    ispell
  ];

  fonts = with pkgs; [
    (nerdfonts.override { fonts = ["Mononoki"]; })
    font-awesome-ttf
    terminus_font_ttf
    iosevka
    fira-code
    fira-code-symbols
    emacs-all-the-icons-fonts
  ];

  misc_test = with pkgs; [
    mono
  ];

in
{

  home.packages =
    system_pkgs
    ++ interface_pkgs
    ++ gui_applications
    ++ cli_applications
    ++ writing_tools
    ++ fonts
    ++ misc_test;

  fonts.fontconfig.enable = true;

  programs.starship.enable = true;

  home.file.".xprofile".text = ''
      # Startup commands
      dbus-launch dropbox start
      albert &
      flameshot &

      # Environment Variables
      export EDITOR=kak
      export VISUAL=kak
  '';

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
  };

  services.picom = {
    enable = true;
    fade = true;
    fadeDelta = 3;
    blur = true;
    activeOpacity = "1";
    inactiveOpacity = "0.95";
    vSync = true;
  };

  programs.home-manager = {
    enable = true;
    path = "…";
  };

  programs.fish = {
    enable = true;
  };



  home.username = "dewey";
  home.homeDirectory = "/home/dewey";

  programs.direnv.enable = true;
  programs.direnv.enableNixDirenvIntegration = true;
  home.stateVersion = "21.03";
}
