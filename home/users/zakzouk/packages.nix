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
  ];

  programs.vscode.extensions = [
    "mhutchie.git-graph" #Git graph
    "mathematic.vscode-latex" #LaTex
    "james-yu.latex-workshop" #Latex Workshop 
    "vscode-icons-team.vscode-icons" #vscode-icons
    "jnoortheen.nix-ide" #Nix IDE
  ];
}
