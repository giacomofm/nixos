# per la password:
# passwd giacomo

{
  users.users.giacomo = {
    uid = 1000;
    isNormalUser = true;
    description = "Giacomo Fraron";
    extraGroups = [ "wheel" "networkmanager" ];
    packages = with pkgs; [
      # roba
    ];
  };
}
