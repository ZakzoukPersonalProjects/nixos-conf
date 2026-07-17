{pkgs, ...}:

{
  home.packages = with pkgs; [
    git
    brave
    discord
    zed-editor
    steam
    wireshark
  ];
}
