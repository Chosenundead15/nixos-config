{ config, pkgs, ...}:

{
  imports =
    [
      ./hardware-configuration.nix
      /etc/nixos/common.nix
    ];
  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.blacklistedKernelModules = [ "rtl8xxxu" ];
  boot.extraModulePackages = with config.boot.kernelPackages; [ rtl8192eu ];
  networking.useDHCP = false;
  networking.interfaces.enp33s0.useDHCP = false;
  networking.interfaces.enp42s0.useDHCP = false;
  networking.interfaces.wlp22s0f0u2u2.useDHCP = true;
  networking.hostId = "be70e80d";

}
