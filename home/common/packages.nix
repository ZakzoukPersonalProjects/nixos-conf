{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fastfetch
    ripgrep
    fd
    eza
    bat
    jq
    tree
    unzip
    zip
    htop
    btop
    wl-clipboard
    pciutils
    net-tools
  ];
}
