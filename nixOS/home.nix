{ config, pkgs, ...}:

{
	home.username = "may";
	home.homeDirectory = "/home/may";
	programs.git.enable = true;
	home.stateVersion = "26.05";
	programs.bash = {
		enable = true;
		shellAliases = {
			btw = "echo I use nixos, btw";
		};
	};
}
