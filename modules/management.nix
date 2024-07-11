{ pkgs, ... }:
{
  home.packages = with pkgs; [
    tomato-c
    dijo
    (pkgs.writeShellScriptBin "management-space" ''
      kitty tomato&
      kitty dijo&
    '')
  ];
}

