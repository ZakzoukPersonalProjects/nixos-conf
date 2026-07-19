{pkgs, ...}:

{
  home.packages = with pkgs; [
    git
    brave
    zed-editor
    steam
    wireshark
  ];
}
