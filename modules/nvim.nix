{ pkgs, pkgs-unstable, ... }:
{
  home.packages = (with pkgs; [
    direnv
    # telescope
    ripgrep
    # lsp
    lua-language-server
    nixpkgs-fmt
    # builders
    gnumake
    nodejs_22
    gcc
    wget
    python3
    # formatters
    stylua
    shellcheck
    shfmt
    (pkgs.writeShellScriptBin "color-nvim" ''
      ls $XDG_RUNTIME_DIR/nvim.*.0 \
     	| xargs -I {} nvim --server {} --remote-send "<Esc>:source ~/.config/nvim/lua/mmed/colors.lua<CR>"
    '')
  ])
  ++
  (with pkgs-unstable; [
    neovim
  ]);
}
