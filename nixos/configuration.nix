# System config for a Framework Laptop 13 (AMD Ryzen AI 300).
#
# Only things that need root live here: boot, hardware, drivers, services,
# PAM, udev. Personal apps and dotfiles live in ../home.
{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    # Framework profile: AMD CPU/GPU tuning, fwupd, the ACP phantom-audio
    # blacklist, a kernel new enough for suspend, and laptop/SSD defaults.
    inputs.nixos-hardware.nixosModules.framework-amd-ai-300-series
  ];

  # --- Boot ------------------------------------------------------------------

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 0; # hold Space while booting to show the menu
    };

    # The Framework module already picks a recent enough kernel.
    # Uncomment to always run the newest one instead:
    # kernelPackages = pkgs.linuxPackages_latest;

    # Quiet boot (press Esc during boot to see messages).
    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
    ];
  };

  # --- Nix -------------------------------------------------------------------

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;

  # --- Locale & time ---------------------------------------------------------

  time.timeZone = "America/Los_Angeles";

  # --- Networking ------------------------------------------------------------

  networking = {
    hostName = "nixos";
    networkmanager.enable = true; # nmcli / nmtui
    # firewall.allowedTCPPorts = [ ];
    # firewall.allowedUDPPorts = [ ];
  };

  services.resolved.enable = true; # Mullvad uses it for DNS

  services.mullvad-vpn = {
    enable = true;
    package = pkgs.mullvad-vpn; # GUI build (the default is CLI-only)
  };

  # --- Desktop ---------------------------------------------------------------

  programs.hyprland.enable = true; # session file, portals, polkit
  services.displayManager.ly.enable = true; # TUI login screen

  security.pam.services.hyprlock = {}; # lets hyprlock check your password

  environment.sessionVariables.NIXOS_OZONE_WL = "1"; # Electron apps on Wayland

  # --- Audio -----------------------------------------------------------------

  services.pulseaudio.enable = false;
  security.rtkit.enable = true; # realtime scheduling for audio

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true; # needed for SDL games
    wireplumber.enable = true;
  };

  # Framework speaker EQ.
  # hardware.framework.laptop13.audioEnhancement.enable = true;

  # --- Hardware & power ------------------------------------------------------

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false; # saves battery; turn on from blueman when needed
  };
  services.blueman.enable = true;

  # Used by the powersaver / balanced / performance aliases.
  services.power-profiles-daemon.enable = true;

  # Firmware updates (fwupd comes from the Framework module):
  #   fwupdmgr refresh && fwupdmgr update

  hardware.opentabletdriver.enable = true;
  hardware.uinput.enable = true; # OpenTabletDriver needs uinput

  services.udev.packages = [pkgs.wooting-udev-rules]; # Wootility access

  # services.printing.enable = true;

  # --- Development -----------------------------------------------------------

  # Lets non-Nix binaries (e.g. from uv) find their libraries.
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [glibc gcc.cc.lib];
  };

  environment.localBinInPath = true; # ~/.local/bin on PATH (uv tools)

  # --- User ------------------------------------------------------------------

  # zsh must be enabled system-wide to be a login shell.
  # Its actual config lives in home/default.nix.
  programs.zsh.enable = true;

  users.users.may = {
    isNormalUser = true;
    shell = pkgs.zsh;
    # audio: PipeWire. video: brightnessctl.
    extraGroups = ["networkmanager" "wheel" "audio" "video"];
  };

  # Kept minimal: just enough for root to repair and rebuild the system.
  environment.systemPackages = with pkgs; [
    vim # rescue editor
    wget
    git # flakes need it
  ];

  # services.openssh.enable = true;

  # --- State version ---------------------------------------------------------

  # Do NOT change without reading the release notes.
  system.stateVersion = "26.05";
}
