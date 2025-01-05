-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.lazyvim_rust_diagnostics = "rust-analyzer"
vim.g.rustfmt_autosave = 1

vim.api.nvim_set_keymap("i", "jj", "<esc>", { noremap = true, silent = true })
