# Home Manager entry point: identity, shell, git, theming.
#
#   packages.nix  apps and CLI tools
#   neovim.nix    Neovim (nvf)
#   links.nix     raw config folders symlinked from ~/dotfiles/config
{pkgs, ...}: {
  imports = [
    ./packages.nix
    ./neovim.nix
    ./links.nix
  ];

  home = {
    username = "may";
    homeDirectory = "/home/may";
    stateVersion = "26.05"; # do NOT change without reading the release notes

    sessionVariables.EDITOR = "nvim";

    # Only matters for tools installed with `foundryup`. The `foundry` package
    # in packages.nix already puts forge/cast/anvil on PATH.
    sessionPath = ["$HOME/.foundry/bin"];
  };

  # --- Shell -----------------------------------------------------------------

  programs.zsh = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/dotfiles";
      powersaver = "powerprofilesctl set power-saver";
      balanced = "powerprofilesctl set balanced";
      performance = "powerprofilesctl set performance";
    };
  };

  # --- Git -------------------------------------------------------------------

  programs.git = {
    enable = true;
    settings.user = {
      name = "grish11";
      email = "141383438+grish11@users.noreply.github.com";
    };
  };

  programs.gh = {
    enable = true;
    settings.git_protocol = "https";
    gitCredentialHelper.enable = true;
  };

  # --- Fonts & theming -------------------------------------------------------

  fonts.fontconfig.enable = true; # makes fonts from packages.nix visible
  # fonts.fontconfig.defaultFonts.monospace = ["JetBrainsMono Nerd Font"];

  gtk = {
    enable = true;
    font = {
      name = "Comic Code"; # or "JetBrainsMono Nerd Font"
      size = 12;
    };
    cursorTheme = {
      name = "Rose Pine";
      package = pkgs.rose-pine-hyprcursor;
    };
  };
}
