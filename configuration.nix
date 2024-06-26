{ config, pkgs, ... }:

{
  imports = [
  ];

  # Let demo build as a trusted user.
  # nix.settings.trusted-users = [ "demo" ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Set your time zone.
  time.timeZone = "America/New_York";

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # nix packages
    nixpkgs-fmt

    # cli utils
    wget
    vim
    jq
    git
    gnumake42 # GNU make 4.2.1

    # dev tools
    asdf-vm # version manager
    vscode

    # desktop apps
    firefox
    discord
    obs-studio
    spotify
  ];

  environment.variables = {
    EDITOR = "vim";
  };
}