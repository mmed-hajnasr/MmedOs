{ pkgs, pkgs-unstable, ... }:
{
  home.packages = (with pkgs; [
    cargo-generate
    # telescope
    ripgrep
    # lsp
    lua-language-server
    nixpkgs-fmt
    typos-lsp
    # formatters
    stylua
    shfmt
    prettierd
    taplo
    (pkgs.writeShellScriptBin "color-nvim" ''
       polarity=$(get-polarity)
       if [ "$polarity" = "dark" ]; then
         echo 'vim.opt.background = "dark"' > ~/.config/nvim/lua/mmed/background.lua
         ls $XDG_RUNTIME_DIR/nvim.*.0 \
         | xargs -I {} nvim --server {} --remote-send "<Esc>:set background=dark<CR>"
       else
         echo 'vim.opt.background = "light"' > ~/.config/nvim/lua/mmed/background.lua
         ls $XDG_RUNTIME_DIR/nvim.*.0 \
         | xargs -I {} nvim --server {} --remote-send "<Esc>:set background=light<CR>"
       fi
       ls $XDG_RUNTIME_DIR/nvim.*.0 \
      	| xargs -I {} nvim --server {} --remote-send "<Esc>:source ~/.config/nvim/lua/mmed/colors.lua<CR>"
    '')
  ])
  ++
  (with pkgs-unstable; [
    neovim
  ]);
}
