{ ... }:

{
  imports = [
    <home-manager/nixos>
    ./users/users.nix
  ];
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.sharedModules = [
    ./common/common.nix
  ];
}
