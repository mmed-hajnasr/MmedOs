{ pkgs, config, ... }: rec {
  home.packages = [
    gtk.theme.package
    gtk.iconTheme.package
  ];
  home.sessionVariables = { GTK_THEME = "Catppuccin-Macchiato-Compact-Pink-Dark"; };
  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };
  gtk = {
    enable = true;
    cursorTheme = {
      name = "Catppuccin-Mocha-Dark-Cursors";
      package = pkgs.catppuccin-cursors.mochaDark;
    };
    theme = {
      name = "adapta-gtk-theme";
      package = pkgs.adapta-gtk-theme;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    font = {
      name = "firacode nerd font";
      size = 11;
    };
  };
  qt = {
    enable = true;
    platformTheme.name = "gtk";
  };
}
