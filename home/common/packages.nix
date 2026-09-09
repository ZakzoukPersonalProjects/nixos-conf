{ pkgs, ... }:

{
  home.packages = with pkgs; [
    zig
    lufus
    kitty
    gtk3
    util-linux
    fastfetch
    ripgrep
    fd
    eza
    bat
    tree
    unzip
    zip
    btop
    nvtopPackages.amd
    wl-clipboard
    net-tools
    texliveFull
    texlab
    font-misc-misc
    libreoffice
    krita

    # Programming languages
    (dotnetCorePackages.combinePackages [
      dotnetCorePackages.sdk_8_0
      dotnetCorePackages.sdk_11_0
    ])
    maven
    cargo
    openjdk25
    nodejs_26
    python3
    gcc
    gdb
  ];
}
