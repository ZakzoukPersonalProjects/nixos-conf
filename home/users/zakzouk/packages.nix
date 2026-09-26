{pkgs, ...}:

{
  home.packages = with pkgs; [
    git
    brave
    vscode
    steam
    wireshark
    rmpc
    podman
    podman-compose
    prismlauncher
    openscad
    dusklight
    logseq
    discord
    presenterm
  ];
}
