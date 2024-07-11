vim.g.mapleader = " "

-- vim.keymap.set("n", "<leader>h", vim.cmd.Ex)

-- move highlited text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep location while half-page jumping and searching
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- copy paste to global clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>p", '"+p')
vim.keymap.set("n", "<leader>P", [["+P]])

-- window navigation keybindings
vim.keymap.set({ "n", "v" }, "<leader>n", "<C-w>")

--- runners
vim.keymap.set("n", "<leader>rr", ":ToggleTerm <CR>cargo run<CR>")
