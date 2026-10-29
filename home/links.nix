# Raw config folders, symlinked straight from ~/dotfiles/config (like Stow).
#
# These are live links, not copies: edit a file in ~/dotfiles/config and the
# app sees it immediately, with no rebuild.
#
#  Add one: move the folder into ~/dotfiles/config/, add its name below,
# `git add` it, then rebuild.
{
  config,
  lib,
  ...
}: let
  # Must be an absolute path string. A relative ./path would be copied into
  # the read-only Nix store instead of linked.
  repo = "${config.home.homeDirectory}/dotfiles/config";
  link = name: {source = config.lib.file.mkOutOfStoreSymlink "${repo}/${name}";};
in {
  xdg.configFile =
    lib.genAttrs [
      "hypr"
      "kitty"
      "rofi"
      "satty"
      "tmux" # tmux reads ~/.config/tmux/tmux.conf
      "waybar"
    ]
    link;
}
