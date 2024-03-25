# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  services.xserver.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.shubh = {
    isNormalUser = true;
    description = "shubh";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.hyprland = {
  enable = true;
  enableNvidiaPatches = true;
  xwayland.enable = true;
  };

  programs.sway.enable = true;
  programs.sway.wrapperFeatures.gtk = true;
  
  environment.sessionVariables = {
  WLR_NO_HARDWARECURSORS = "1";
  NIXOS_OZONE_WL = "1";
  };
  
  hardware = {
  opengl.enable = true;
  nvidia.modesetting.enable = true;
  };
  
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
 
  # Enable sound with pipe wire
  sound.enable = true;
  security.rtkit.enable = true;
  sound.mediaKeys.enable = true;
  sound.mediaKeys.volumeStep = "5%";
  services.pipewire = {
  enable = true;
  alsa.enable = true;
  alsa.support32Bit = true;
  pulse.enable = true;
  jack.enable = true;
  };

  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = [ "FiraCode" ]; })
  ];

  # Hopefully lets mason from nvim work.
  programs.nix-ld.enable = true;

  # For screenshotting
  programs.thunar.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     wget
     (waybar.overrideAttrs (oldAttrs: { mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true"]; }))
     dunst
     libnotify
     swww
     eww
     kitty
     rofi-wayland
     google-chrome
     neovim
     bash
     networkmanagerapplet
     git
     gh
     python3
     catppuccin-gtk
     themechanger
     gtk3
     gtk4
     gnome.gnome-themes-extra
     pipewire
     brightnessctl
     wl-clipboard
     starship
     libgcc
     gcc
     glibc
     fd
     zip
     unzip
     fzf
     ripgrep
     gnumake
     nodejs_21
     shotman
     slurp
     swayidle
     libxml2
     libarchive
     openssl
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  nix.settings.experimental-features = [ "nix-command" "flakes"];

}
