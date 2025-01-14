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

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.catppuccin-cursors.frappeDark;
    name = "Catppuccin-Frappe-Light-Cursors";
    size = 16;
  };

  gtk = {
    enable = true;

    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };

    theme = {
      name = "Catppuccin-Orange-Light-Compact";
      package = pkgs.catppuccin-gtk.override {
        size = "compact";
        variant = "frappe";
      };
    };

    cursorTheme = {
      package = pkgs.catppuccin-cursors.frappeDark;
      name = "Catppuccin-Frappe-Light-Cursors";
    };

    font = {
      name = "firacode nerd font";
      size = 12;
    };
  };
  qt = {
    enable = true;
    platformTheme.name = "gtk";
  };
}
