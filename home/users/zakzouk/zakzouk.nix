{ ... }:

{
  imports = [
    ./user.nix
  ];

  home-manager.users.zakzouk = {
    imports = [
      ./packages.nix
    ];

    home.username = "zakzouk";
    home.homeDirectory = "/home/zakzouk";

    home.stateVersion = "26.05";
  };
}
