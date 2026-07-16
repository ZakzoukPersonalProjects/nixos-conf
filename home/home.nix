{ ... }:

{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.zakzouk = import ./users/zakzouk/zakzouk.nix;
}
