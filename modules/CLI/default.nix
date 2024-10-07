{ pkgs, lib, ... }:
let
  MyAliases = {
    ssh = "kitty +kitten ssh";
    please = "sudo $(fc -ln -1)";
    selfdestruct = "tokill=$(pwd) && cd .. && rm -rf $tokill";
    vc = "code --disable-gpu";
    ls = "eza -1   --icons=auto"; # short list
    ll = "eza -lha --icons=auto --sort=name --group-directories-first"; # long list all
    ld = "eza -lhD --icons=auto"; # long list dirs
    zathura = "zathura --fork"; # fork zathura
    nix-shell = "nix-shell --command zsh";
    reset_keyboard = "systemctl restart xremap.service";
    neofetch = "neofetch --source ~/.config/neofetch/logo";
    yy = "yazi";
    syy = "sudo yazi";
    vi = "neovide";
    do-me = "~/projects/do-me/target/debug/do-me";
  };
in
{

  imports = [
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    eza # A modern replacement for ls
    zoxide # A faster way to navigate your filesystem
    bat # A cat(1) clone with wings. better syntax highlighting.
    fd # A simple, fast and user-friendly alternative to 'find'
    sd # Intuitive find & replace CLI (sed alternative)
    just # A handy way to save and run project-specific commands
    starship # The minimal, blazing-fast, and infinitely customizable prompt for any shell!
    direnv
  ];

  programs.zsh = {
    enable = lib.mkDefault true;
    shellAliases = MyAliases;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [ "--cmd cd" ];
  };
}
