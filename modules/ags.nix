{ inputs, pkgs, ... }:
{
  # add the home manager module
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;

    # additional packages to add to ags's runtime
    extraPackages = with pkgs; [
      inputs.ags.packages.${pkgs.system}.battery
      fzf
      wireplumber
      libgtop
      bluez
      bluez-tools
      networkmanager
      dart-sass
      wl-clipboard
      upower
      gvfs
    ];
  };
}
