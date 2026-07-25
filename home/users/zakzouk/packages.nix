{pkgs, ...}:

{
  home.packages = with pkgs; [
    git
    brave
    vscode
    steam
    wireshark
    rmpc
    winboat
    podman
    podman-compose
    prismlauncher
    openscad
  ];
}
