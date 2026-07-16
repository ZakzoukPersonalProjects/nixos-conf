{ ... }:

{
  imports = [
    ../../common/common.nix
    ./packages.nix
  ];

  home.username = "zakzouk";
  home.homeDirectory = "/home/zakzouk";

  home.stateVersion = "26.05";
}
