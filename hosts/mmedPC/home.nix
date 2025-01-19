{ username
, config
, ...
}:
let
  inherit (import ./variables.nix) gitUsername gitEmail dotfilesPath browser editor;
  static_files = dotfilesPath + "/non-nix";
in
{
  # Home Manager Settings
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "24.05";
  home.sessionVariables = {
    EDITOR = editor;
    FLAKE = dotfilesPath;
    BROWSER = browser;
  };


  # Import Program Configurations
  imports = [
    ../../modules/ags.nix
    # ../../modules/waybar.nix
    ../../modules/games.nix
    ../../modules/drawing.nix
    ../../modules/apps.nix
    ../../modules/nvim.nix
    ../../modules/gtk.nix
    ../../modules/discord.nix
    ../../modules/zsh.nix
    ../../modules/theming.nix
    ../../modules/spicetify.nix
    ../../modules/hyprland.nix
    ../../modules/dev.nix
    ../../modules/task-management.nix
    ../../modules/movements.nix
  ];

  home.file = {
    ".config/kitty/kitty.conf".source = config.lib.file.mkOutOfStoreSymlink "${static_files}/kitty.conf";
    ".config/functions.sh".source = config.lib.file.mkOutOfStoreSymlink "${static_files}/functions.sh";
    ".config/hypr".source = config.lib.file.mkOutOfStoreSymlink "${static_files}/hypr";
    ".config/starship.toml".source = config.lib.file.mkOutOfStoreSymlink "${static_files}/starship.toml";
    ".config/waybar".source = config.lib.file.mkOutOfStoreSymlink "${static_files}/waybar";
    ".config/zathura".source = config.lib.file.mkOutOfStoreSymlink "${static_files}/zathura";
    ".config/yazi/yazi.toml".source = config.lib.file.mkOutOfStoreSymlink "${static_files}/yazi.toml";
    ".config/flavours".source = config.lib.file.mkOutOfStoreSymlink "${static_files}/flavours";
    ".config/cava".source = config.lib.file.mkOutOfStoreSymlink "${static_files}/cava";
    ".config/neofetch".source = config.lib.file.mkOutOfStoreSymlink "${static_files}/neofetch";
    ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${static_files}/nvim";
    ".config/swappy/config".text = ''
      [Default]
      save_dir=/home/${username}/Pictures/Screenshots
      save_filename_format=swappy-%Y%m%d-%H%M%S.png
      show_panel=false
      line_size=5
      text_size=20
      text_font=Ubuntu
      paint_mode=brush
      early_exit=true
      fill_shape=false
    '';
  };

  # xdg-open defaults
  xdg.mimeApps = {
    enable = true;
    associations.added = {
      "application/pdf" = [ "org.pwmt.zathura.desktop" ];
    };
    defaultApplications = {
      "text/*" = "nvim.desktop";
      "text/x-lua" = "nvim.desktop";
      "image/*" = "Gimp";
      "image/jpeg" = "Gimp";
      "image/png" = "Gimp";
      "application/pdf" = "org.pwmt.zathura.desktop";
      "x-scheme-handler/http" = "${browser}.desktop";
      "x-scheme-handler/https" = "${browser}.desktop";
      "x-scheme-handler/unknown" = "${browser}.desktop";
    };
  };


  # Install & Configure Git
  programs.git = {
    enable = true;
    userName = "${gitUsername}";
    userEmail = "${gitEmail}";
  };

  # Create XDG Dirs
  xdg = {
    userDirs = {
      enable = true;
    };
  };

  # Scripts
  home.packages = [
  ];

  programs = {
    gh.enable = true;
    btop = {
      enable = true;
      settings = {
        vim_keys = true;
      };
    };
    home-manager.enable = true;
  };
}
