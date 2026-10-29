# User packages, grouped by purpose.
{pkgs, ...}: {
  home.packages = with pkgs; [
    # --- CLI tools ---
    tree
    tmux
    btop
    fastfetch
    unzip
    exiftool
    claude-code

    # --- Development ---
    nodejs
    uv
    gleam
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

    # --- Apps ---
    firefox
    tor-browser
    vesktop
    spotify
    bitwarden-desktop
    nautilus
    vscode
    calibre
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
    supertux
    ninvaders

    # --- Fonts ---
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
  ];
}
