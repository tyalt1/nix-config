{ config, pkgs, ... }:

{
  imports = [
    <nixpkgs/nixos/modules/installer/virtualbox-demo.nix>
  ];

  # Let demo build as a trusted user.
# nix.settings.trusted-users = [ "demo" ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];


# Mount a VirtualBox shared folder.
# This is configurable in the VirtualBox menu at
# Machine / Settings / Shared Folders.
# fileSystems."/mnt" = {
#   fsType = "vboxsf";
#   device = "nameofdevicetomount";
#   options = [ "rw" ];
# };

# By default, the NixOS VirtualBox demo image includes SDDM and Plasma.
# If you prefer another desktop manager or display manager, you may want
# to disable the default.
# services.xserver.desktopManager.plasma5.enable = lib.mkForce false;
# services.xserver.displayManager.sddm.enable = lib.mkForce false;

# Enable GDM/GNOME by uncommenting above two lines and two lines below.
# services.xserver.displayManager.gdm.enable = true;
# services.xserver.desktopManager.gnome.enable = true;

# Set your time zone.
  time.timeZone = "America/New_York";

  nixpkgs.config.allowUnfree = true;

# List packages installed in system profile. To search, run:
# \$ nix search wget
  environment.systemPackages = with pkgs; [
    # nix packages
    nixpkgs-fmt    

    # cli utils
    wget
    vim
    jq
    git

    # dev tools
    asdf-vm # version manager
    vscode

    # desktop apps
    firefox
    discord
    obs-studio
    spotify
  ];

#  home.file.".tool-versions" = {
#    executable = false;
#    text = ''
#    python 3.12.2
#    '';
#  };

# Enable the OpenSSH daemon.
# services.openssh.enable = true;

}
