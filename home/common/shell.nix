{lib, pkgs, ... }:

{
  programs.bash = {
    enable = true;

    shellAliases = {
      ll = "eza -lah";
      la = "eza -a";
      ls = "eza";
      cat = "bat";
      grep = "rg";
    };

    bashrcExtra = ''
      export PATH="$PATH:$HOME/.cargo/bin"
    '';

    initExtra = ''
      jaaj-rs
    '';
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.starship = {
    enable = true;
  };
}
