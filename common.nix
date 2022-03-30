{ config, pkgs, ...}:

{
  time.timeZone = "America/Caracas";
  users.extraUsers.snaider = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
  boot.supportedFilesystems = [ "ntfs" ];
  boot.tmpOnTmpfs = true;
  boot.supportedFilesystems = [ "ntfs" ];
  zramSwap.enable = true;
  networking.networkmanager.enable = true;
  networking.extraHosts = 
    ''
      192.168.56.77 next.learnt.io api.next.learnt.io
    '';
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];

  # Enable the gnome
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.hplipWithPlugin  ];
  
  hardware.pulseaudio.enable = false; 
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    jack.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };

  nixpkgs.config.allowUnfree = true;
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "snaider" ];
  
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor i>
    wget
    vagrant
    docker
    pciutils
    usbutils
    discord
    git
    firefox
    lutris
    nur.repos.dukzcry.gamescope
    corectrl
    zip
    unzip
    openjdk
    psmisc
    gnomeExtensions.appindicator
    mangohud
    firefox
    protonup
  ];

  services.udev.packages = with pkgs; [ gnome3.gnome-settings-daemon ];

  programs.steam.enable = true;
  programs.fish.enable = true;
  users.extraUsers.snaider = {
    shell = pkgs.fish;
  };
  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.flatpak.enable = true;
  services.gvfs.enable = true;
  services.zfs.autoSnapshot.enable = true;
  
  system.stateVersion = "21.11"; # Did you read the comment?
  
  hardware.enableRedistributableFirmware = true;
  hardware.opengl.driSupport = true;

  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };
}
