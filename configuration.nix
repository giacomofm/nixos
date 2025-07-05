{ config, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./nvidia.nix
    ./locale.nix
    ./users.nix
  ];
  system.stateVersion = "25.05";
  # Boot
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.editor = false;
  system.autoUpgrade.channel = "https://channels.nixos.org/nixos-25.05";
  # Desktop
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.gnome.core-apps.enable = false;
  programs.sway.enable = true;
  # PipeWire
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };
  # App
  nixpkgs.config.allowUnfree = true;
  programs.firefox.enable = true;
  environment.systemPackages = with pkgs; [
    git
    vlc
    sublime
  ];
}
