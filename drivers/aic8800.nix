# Driver for the AIC8800D80 USB WiFi adapter (e.g. UGREEN AX900).
# Source: https://github.com/shenmintao/aic8800d80
{ config, lib, pkgs, ... }:

let
  # One package containing the kernel modules, firmware and udev rules.
  # It is built with callPackage from boot.kernelPackages so it always
  # matches the kernel you are running.
  aic8800 = config.boot.kernelPackages.callPackage
    ({ stdenv, lib, fetchFromGitHub, kernel, util-linux, usb-modeswitch }:
      stdenv.mkDerivation {
        pname = "aic8800";
        version = "unstable";

        src = fetchFromGitHub {
          owner = "shenmintao";
          repo = "aic8800d80";
          rev = "main";          # pin to a commit hash once it works
          hash = "sha256-XlK7zZW22YUPzdy1aynzEpPxNGVfYODZ3GoOxVztTIc=";
        };

        nativeBuildInputs = kernel.moduleBuildDependencies;
        hardeningDisable = [ "pic" "format" ];

        # The driver's Makefile hardcodes /lib/modules/$(uname -r)/build,
        # so point it at the kernel headers of the kernel NixOS is using.
        makeFlags = [
          "KDIR=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build"
        ];

        # The driver source is in a subfolder of the repo.
        preBuild = "cd drivers/aic8800";

        installPhase = ''
          runHook preInstall
          cd ../..   # back to the repo root

          # 1. Kernel modules (aic_load_fw.ko, aic8800_fdrv.ko, ...)
          mkdir -p $out/lib/modules/${kernel.modDirVersion}/extra
          find drivers/aic8800 -name '*.ko' \
            -exec install -m644 {} $out/lib/modules/${kernel.modDirVersion}/extra/ \;

          # 2. Firmware, loaded by the driver from /lib/firmware
          mkdir -p $out/lib/firmware
          cp -r fw/aic8800* $out/lib/firmware/

          # 3. udev rules (switches the adapter out of its fake "CD-ROM" mode).
          #    The rules use /usr/bin paths, which do not exist on NixOS.
          mkdir -p $out/lib/udev/rules.d
          cp aic.rules $out/lib/udev/rules.d/99-aic8800.rules
          substituteInPlace $out/lib/udev/rules.d/99-aic8800.rules \
            --replace-quiet /usr/bin/eject ${util-linux}/bin/eject \
            --replace-quiet /usr/bin/usb_modeswitch ${usb-modeswitch}/bin/usb_modeswitch

          runHook postInstall
        '';
      }) {};
in
{
  # Build and load the kernel modules.
  boot.extraModulePackages = [ aic8800 ];
  boot.kernelModules = [ "aic_load_fw" "aic8800_fdrv" ];

  # Install the firmware and udev rules from the same package.
  hardware.firmware = [ aic8800 ];
  services.udev.packages = [ aic8800 ];

  # Tool needed to switch the adapter out of storage mode.
  environment.systemPackages = [ pkgs.usb-modeswitch ];

  # Lets you connect to WiFi (remove if already enabled elsewhere).
  networking.networkmanager.enable = true;
}