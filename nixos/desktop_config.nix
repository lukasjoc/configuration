# Desktop NixOs config using xfce4 ;)

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Hardware
  hardware.pulseaudio.enable = true;
  sound.enable = true;

  # Booting
  boot = {
    loader.grub = {
      enable = true;
      version = 2;
      device = "/dev/sda";
    };
    tmpOnTmpfs = true;
  };

  # Networking
  networking = {
    firewall.enable = false;
    hostName = "deimos";
    useDHCP = false;
    interfaces.enp0s3.useDHCP = true;
    interfaces.enp0s8.useDHCP = true;
    proxy.noProxy = "127.0.0.1,localhost,internal.domain";
    networkmanager.enable = true;
  };

  # Time and Locale
  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = "Europe/Berlin";
  console = {
   font = "Lat2-Terminus16";
   keyMap = "us";
  };

  fonts = {
    enableDefaultFonts = true;
    fonts = with pkgs; [
      ibm-plex
    ];
  };

  # Frequent Services
  services = {
    xserver = {
	    enable = true;
  	  layout = "us";
	    xkbOptions = "eurosign:e";
	    libinput.enable = true;
	    desktopManager.xterm.enable = false;
	    desktopManager.xfce.enable = true;
	    displayManager.lightdm.enable = true;
	    displayManager.defaultSession = "xfce";
    };
    picom = {
      enable = true;
      fade = true;
      inactiveOpacity = 0.9;
      shadow = true;
      fadeDelta = 4;
    };
    openssh.enable = true;
    ntp = {
      enable = true;
      servers = [
        "0.de.pool.ntp.org"
        "1.de.pool.ntp.org"
        "2.de.pool.ntp.org"
        "3.de.pool.ntp.org"
      ];
    };
  };

  # Programs to enable
  programs = {
    fish.enable = true;
    # ulauncher.enable = true;
    # gitAndTools.gitFull = {
    #   enable = true;
    #   username = "lukasjoc";
    #   userEmail = "jochamlu@gmail.com";
    # };
    # TODO: tmux git with homeManager
  };

  # Packages -- nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
	  # Tools
	  tmux vim neovim bash fish tree curl htop iftop
    ripgrep mlocate findutils ctags
	  zip xz jq pandoc exa ddgr starship whois file lsof
    gitAndTools.gh gitAndTools.gitFull colordiff

	  #Langs
	  go go-tools python3 nim rustc
    perl erlang elixir llvm vlang

	  #Extras
	  firefox brave alacritty vscodium gnvim
	  lightdm ulauncher picom figlet neofetch
    qemu_kvm virt-manager docker
  ];

  # Default user settings
  users = {
    extraUsers.lukasjoc = {
      isNormalUser = true;
      home = "/home/lukasjoc";
      shell = pkgs.fish;
      extraGroups = [
        "wheel"
        "networkmanager"
        "docker"
        "libvirt"
        "audio"
      ];
    };
  };

  # Virtualisation and Docker
  virtualisation = {
    docker.enable = true;
    libvirtd = {
      enable = true;
      qemuPackage = pkgs.qemu_kvm;
    };
  };

  # Nixos Behaviour
  nix = {
    gc = {
      automatic = true;
      dates =  "12:00";
    };
    autoOptimiseStore = true;
  };

  system.stateVersion = "20.09";
}

