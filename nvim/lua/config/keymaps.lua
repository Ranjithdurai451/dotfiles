-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = false })
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = false })
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Remap <leader><space> to find files in cwd
vim.keymap.set("n", "<leader><space>", function()
  -- Corrected usage for snacks.nvim's file picker
  require("snacks").picker.files({ cwd = vim.uv.cwd() })
end, { desc = "Find Files (cwd)" })
