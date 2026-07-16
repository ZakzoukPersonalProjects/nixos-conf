{ ... }:

{
  users.users.zakzouk = {
    isNormalUser = true;
    description = "Zakzouk";
    extraGroups = [
      "wheel"
      "networkmanager"
      "audio"
      "video"
    ];
  };
}
