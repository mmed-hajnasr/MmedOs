{ inputs, pkgs, ... }:
{
  # add the home manager module
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;

    # additional packages to add to ags's runtime
    extraPackages = [
      inputs.ags.packages.${pkgs.system}.apps
    ];
  };
}
