local opt = vim.opt

opt.relativenumber = true
opt.number = true
opt.termguicolors = true
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ 'r', 'o' })
  end,
})

-- turn off swapfile
opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 2
vim.opt.softtabstop = 2
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
vim.opt.smartindent = true

vim.opt.scrolloff = 18
vim.opt.isfname:append("@-@")

-- this is for obsidian.nvim
vim.opt.conceallevel = 2

