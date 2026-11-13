# User packages, grouped by purpose.
{
  pkgs,
  inputs,
  ...
}: let
  unstable = inputs.nixpkgs-unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system};
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

    # --- Hyprland desktop ---
    kitty
    waybar
    rofi
    hyprlock
    hypridle
    hyprpaper
    rose-pine-hyprcursor
    networkmanagerapplet

    # --- Screenshots & clipboard (SUPER+S: slurp -> grim -> satty) ---
    grim
    slurp
    satty
    wl-clipboard

    # --- Media keys & audio ---
    playerctl
    brightnessctl
    pavucontrol

    # Video player & fuzzy finder
    mpv
    fzf

    # --- Apps ---
    firefox
    tor-browser
    vesktop
    spotify
    bitwarden-desktop
    nautilus
    vscode
    code-cursor
    xournalpp
    localsend
    lmstudio
    wootility

    # --- Office ---
    libreoffice
    hunspell # spell checking for LibreOffice
    hunspellDicts.en_US

    # --- Games ---
    osu-lazer-bin
    prismlauncher

    # --- Fonts ---
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
  ];
}
