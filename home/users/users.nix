{ ... }:

{
  home-manager.users.zakzouk = import ./zakzouk/zakzouk.nix;
  programs.home-manager.enable = true;
}
