{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fastfetch
    ripgrep
    fd
    eza
    bat
    tree
    unzip
    zip
    btop
    nvtopPackages.amd
    wl-clipboard
    copyq
    net-tools
  ];

  # Autostart CopyQ on login
  xdg.configFile."autostart/copyq.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=CopyQ
    Exec=${pkgs.copyq}/bin/copyq
    X-GNOME-Autostart-enabled=true
  '';

  # Super+V opens clipboard history
  dconf.settings = {
    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/copyq/"
      ];
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/copyq" = {
      name = "CopyQ Clipboard History";
      command = "${pkgs.copyq}/bin/copyq toggle";
      binding = "<Super>v";
    };
  };
}
