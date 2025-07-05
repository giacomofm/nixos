# per la password:
# passwd giacomo

{ pkgs, ... }: {
  users.users.giacomo = {
    uid = 1000;
    isNormalUser = true;
    description = "Giacomo Fraron";
    extraGroups = [ "wheel" "networkmanager" ];
    packages = with pkgs; [
      jetbrains-toolbox
    ];
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    };
  };
}
