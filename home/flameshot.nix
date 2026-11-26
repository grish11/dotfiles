# flameshot.nix
{
  pkgs,
  inputs,
  ...
}: let
  unstable = import inputs.nixpkgs-unstable {
    system = pkgs.stdenv.hostPlatform.system;
  };
in {
  # The Hyprland portal needs grim on its PATH to take screenshots
  home.packages = with pkgs; [grim slurp];

  services.flameshot = {
    enable = true;
    package = unstable.flameshot; # v14+ fixes HiDPI scaling
    settings.General = {
      showStartupLaunchMessage = false;
      disabledTrayIcon = true;
    };
  };
}
