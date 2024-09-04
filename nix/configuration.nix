{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;

  time.timeZone = "America/Los_Angeles";

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

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  xdg = {
    sounds.enable = true;
    portal = {
      enable = true;
      # needed if gnome isn't installed
      # extraPortals = with pkgs; [
      # 	xdg-desktop-portal-gtk
      # ];
      xdgOpenUsePortal = true;
      wlr.enable = true;
      config = {
        common.default = ["gtk"];
	sway = {
	  default = [ "wlr" ];
	};
	swayfx = {
	  default = [ "wlr" ];
	};
	Hyprland = {
	  default = [ "hyprland" ];
	};
      };
    };
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.flatpak.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.gnome.sushi.enable = true;
  services.gnome.gnome-settings-daemon.enable = true;
  services.gnome.gnome-online-accounts.enable = true;
  services.printing.enable = true; # Enable CUPS to print documents.


  hardware = {
    graphics.enable = true;
    enableAllFirmware = true;
    bluetooth.enable = true;
    pulseaudio.enable = false;
    firmware = with pkgs; [
      rtl8761b-firmware
    ];
    cpu = {
      intel.sgx.provision.enable = true;
    };
    intel-gpu-tools.enable = true;
    amdgpu = {
      opencl.enable = true;
      amdvlk.enable = true;
    };
    acpilight.enable = true;
    uinput.enable = true;
    i2c.enable = true;
    steam-hardware.enable = true;
    graphics.extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      vaapiIntel         # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  virtualisation = {
    lxd.enable = true;
    lxd.agent.enable = true;
    lxc.enable = true;
    kvmgt.enable = true;
    containerd.enable = true;
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    # extraConfig.pipewire."10-clock-rate" = {
    #   "context.properties" = {
    #     "default.clock.rate"          = 48000;
    #     "default.clock.allowed-rates" = [ 48000 ];
    #     "default.clock.quantum"       = 2048;
    #     "default.clock.min-quantum"   = 1024;
    #   };
    # };
  };

  users.users.clayton = {
    isNormalUser = true;
    description = "Clayton";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
    packages = with pkgs; [
    ];
  };

  nixpkgs.config.allowUnfree = true;
  programs.firefox.enable = true;
  programs.fish.enable = true;
  programs.sway = {
    enable = true;
    # package = pkgs.swayfx;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
      waybar
      grim
      slurp
      wl-clipboard
      wf-recorder
      wl-screenrec
      wdisplays
      swaylock
      chayang
      swayidle
      swaynotificationcenter
      swayosd
      wlogout
      wofi
      swww
      nwg-dock
      nwg-displays
      wtype
      brightnessctl
      playerctl
      blueman
      networkmanagerapplet
      gnome-calendar
      gnome-disk-utility
      gnome.gnome-control-center
    ];
  };
  programs.hyprland = {
    enable = true;
  };
  programs.hyprlock.enable = true;
  environment.systemPackages = with pkgs; [
    hypridle
    alacritty
    vim
    git
    nerdctl
    go
    lm_sensors
    nvtopPackages.full
    ddcutil
    buildkit
    pinentry-gnome3
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
  services.openssh.enable = true;
  services.tailscale.enable = true;

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
  system.stateVersion = "24.05"; # Did you read the comment?

}
