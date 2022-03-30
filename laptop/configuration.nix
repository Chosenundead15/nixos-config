{ config, pkgs, ...}:

{
  imports =
    [
      ./hardware-configuration.nix
      ../common.nix
    ];
  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.useDHCP = false;
  networking.interfaces.eno1.useDHCP = true;
  networking.interfaces.wlp4s0.useDHCP = true;
  networking.hostId = "dfbbc1c6";
}

