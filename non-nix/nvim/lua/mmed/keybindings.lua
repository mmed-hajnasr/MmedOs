vim.g.mapleader = " "

vim.keymap.set("i", "<C-c>", "<C-g>u<Esc>[s1z=`]a<C-g>u", { desc = "Correct last misspelled word", noremap = true, silent = true })

-- move highlighted text
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

-- delete without yanking
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- paste without yanking
vim.keymap.set("x", "<C-p>", [["_dP]])

-- window navigation keybindings
vim.keymap.set({ "n", "v" }, "<C-n>", "<C-w>")
vim.keymap.set({ "n", "v" }, "<C-l>", function()
  vim.cmd('wincmd w')
  local total_width = vim.o.columns  -- Get the total width of the Vim window
  local target_width = math.floor(total_width * 0.65)  -- Calculate 70% of the total width
  vim.cmd('vertical resize ' .. target_width)  -- Set the window to 70% width
end)
--obsedian keybindings
vim.keymap.set({ "n" }, "<leader>on", ":ObsidianNew<CR>")
vim.keymap.set({ "n" }, "<leader>os", ":ObsidianQuickSwitch<CR>")
vim.keymap.set({ "n" }, "<leader>ow", ":ObsidianSearch<CR>")
vim.keymap.set({ "n" }, "<leader>ot", ":ObsidianNewFromTemplate<CR>")
