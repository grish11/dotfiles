# User packages, grouped by purpose.
{
  pkgs,
  inputs,
  ...
}: let
  unstable = import inputs.nixpkgs-unstable {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };
in {
  home.packages = with pkgs; [
    # --- CLI tools ---
    tree
    tmux
    btop
    fastfetch
    unzip
    exiftool
    claude-code
    yazi
    unstable.ani-cli

    # --- Development ---
    nodejs
    uv
    gleam
    beamPackages.erlang # for gleam
    beamPackages.rebar3 # also for gleam
    foundry
    (python3.withPackages (ps:
      with ps; [
        pytest # 61A
        jupyter
        ipyparallel
        numpy
      ]))
    gcc
    gdb
    sqlite-interactive
    elan

    # --- Hyprland desktop ---
    kitty
    waybar
    rofi
    hyprlock
    hypridle
    hyprpaper
    rose-pine-hyprcursor
    networkmanagerapplet

    # --- Media keys & audio ---
    playerctl
    brightnessctl
    pavucontrol

    # Video player & fuzzy finder
    mpv
    fzf

    # --- Apps ---
    librewolf
    tor-browser
    vesktop
    spotify
    bitwarden-desktop
    nautilus
    vscode
    unstable.code-cursor
    xournalpp
    localsend
    wootility

    # --- Games ---
    osu-lazer-bin
    (prismlauncher.override {
      jdks = [jdk25 jdk21 jdk17 jdk8];
    })
    lunar-client

    # --- Fonts ---
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
  ];
}
