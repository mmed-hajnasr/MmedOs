{ pkgs, pkgs-unstable, ... }:
{
  home.packages = (with pkgs; [
    cargo-generate
    # telescope
    ripgrep
    # lsp
    rust-analyzer
    nil
    pyright
    black
    isort
    lua-language-server
    nixpkgs-fmt
    # builders
    nodejs_22
    # formatters
    stylua
    shfmt
    prettierd
    taplo
    (pkgs.writeShellScriptBin "color-nvim" ''
      sleep 2
      ls $XDG_RUNTIME_DIR/nvim.*.0 \
      	| xargs -I {} nvim --server {} --remote-send "<Esc>:Lazy reload base16-nvim<CR>"
      ls $XDG_RUNTIME_DIR/nvim.*.0 \
      	| xargs -I {} nvim --server {} --remote-send "<Esc>:Lazy reload lualine.nvim<CR>"
    '')
  ])
  ++
  (with pkgs-unstable; [
    neovim
  ]);
}
