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
    btop
    nvtopPackages.amd
    wl-clipboard
    pciutils
    net-tools
  ];
}
