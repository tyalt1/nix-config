{ config, pkgs, ... }:

{
  imports = [
    <nixpkgs/nixos/modules/installer/virtualbox-demo.nix>
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Let demo build as a trusted user.
  # nix.settings.trusted-users = [ "demo" ];

  time.timeZone = "America/New_York";

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # cli utils
    wget
    vim
    jq
    git
    gnumake42 # GNU make 4.2.1

    # dev tools
    asdf-vm # version manager
    vscode
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

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
}
