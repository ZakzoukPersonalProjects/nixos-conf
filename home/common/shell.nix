{ ... }:

{
  programs.bash = {
    enable = true;

    shellAliases = {
      ll = "eza -lah";
      la = "eza -a";
      ls = "eza";
      cat = "bat";
      grep = "rg";
      update = "home-manager switch";
    };
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.starship = {
    enable = true;
  };
}
