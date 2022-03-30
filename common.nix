{ config, pkgs, ...}:

{
  time.timeZone = "America/Caracas";
  users.extraUsers.snaider = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
  boot.supportedFilesystems = [ "ntfs" ];
  boot.tmpOnTmpfs = true;
  zramSwap.enable = true;
  networking.networkmanager.enable = true;
  networking.extraHosts = 
    ''
      192.168.56.77 next.learnt.io api.next.learnt.io
    '';
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];

  # Enable the Plasma 5 Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Configure keymap in X11
  services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.hplipWithPlugin  ];
  
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
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
    plasma-nm
    discover
    discord
    libsForQt5.bismuth
    libsForQt5.kdeconnect-kde
    git
    firefox
    ktorrent
    lutris
    skanlite
    nur.repos.dukzcry.gamescope
    corectrl
    zip
    unzip
    openjdk
  ];

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

  system.stateVersion = "21.11"; # Did you read the comment?
  
  hardware.enableRedistributableFirmware = true;
  hardware.opengl.driSupport = true;

  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };
}
