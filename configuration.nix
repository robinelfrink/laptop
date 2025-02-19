{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelModules = ["ecryptfs"];

  # Encryption
  security.pam.enableEcryptfs = true;

  # Networking
  networking.hostName = "zaphod";
  networking.networkmanager.enable = true;

  # Localization
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "nl_NL.UTF-8";
    LC_IDENTIFICATION = "nl_NL.UTF-8";
    LC_MEASUREMENT = "nl_NL.UTF-8";
    LC_MONETARY = "nl_NL.UTF-8";
    LC_NAME = "nl_NL.UTF-8";
    LC_NUMERIC = "nl_NL.UTF-8";
    LC_PAPER = "nl_NL.UTF-8";
    LC_TELEPHONE = "nl_NL.UTF-8";
    LC_TIME = "nl_NL.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "euro";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };

  virtualisation.containers.enable = true;
  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Install packages
  environment.systemPackages = with pkgs; [
    appimage-run
    audacity
    direnv
    ecryptfs
    gimp
    git
    gnomeExtensions.dash-to-dock
    gnucash
    go
    google-chrome
    inkscape
    libreoffice
    musescore
    networkmanager-openconnect
    nextcloud-client
    python3
    signal-desktop
    slack
    tmux
    vim
    virtualbox
    vscode
    wget
    whatsapp-for-linux
  ];

  # This is me.
  users.users.robin = {
    isNormalUser = true;
    description = "Robin Elfrink";
    extraGroups = [ "networkmanager" "wheel" ];
    hashedPassword = "$6$1ibk.hBqsHrevy5x$naYYCBfe8Y9rCOFRga/L8dfZbJHoTkWhsQ1ol0KzfG91vY8RTBXJrrFo.TDXbZtjtIVFnblawSeu6bvKGmcmb/";
  };

  system.stateVersion = "24.11";

}
