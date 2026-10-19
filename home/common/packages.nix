{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gparted
    zig
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
    superfile
    ffmpeg
    mpv
    wine64
    podman

    # Programming languages
    (dotnetCorePackages.combinePackages [
      dotnetCorePackages.sdk_8_0
      dotnetCorePackages.sdk_11_0
    ])
    maven
    cargo
    openjdk25
    nodejs_26
    (python3.withPackages (ps: with ps; [
      numpy
      pandas
      matplotlib
      pyspark
    ]))
    gcc
    gdb
    rustc
  ];
}
