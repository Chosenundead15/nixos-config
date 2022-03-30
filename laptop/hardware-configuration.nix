# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "sd_mod" "sdhci_pci" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "zroot/root";
      fsType = "zfs";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/6A30-7D31";
      fsType = "vfat";
    };

  fileSystems."/nixos" =
    { device = "zroot/nixos";
      fsType = "zfs";
    };

  fileSystems."/var" =
    { device = "zroot/var";
      fsType = "zfs";
    };

  fileSystems."/home" =
    { device = "zroot/home";
      fsType = "zfs";
    };

  fileSystems."/home/snaider/.steam" =
    { device = "zroot/steam";
      fsType = "zfs";
    };

  swapDevices = [ ];

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
