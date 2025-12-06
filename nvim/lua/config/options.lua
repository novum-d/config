-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.lazyvim_rust_diagnostics = "rust-analyzer"
-- vim.g.rustfmt_autosave = 1

vim.api.nvim_set_keymap("i", "jj", "<esc>", { noremap = true, silent = true })

vim.opt.spelllang = { "en", "cjk" }

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "SpellBad", { fg = "#669966", undercurl = true })
    vim.api.nvim_set_hl(0, "SpellCap", { fg = "#669966", undercurl = true })
    vim.api.nvim_set_hl(0, "SpellRare", { fg = "#669966", undercurl = true })
    vim.api.nvim_set_hl(0, "SpellLocal", { fg = "#669966", undercurl = true })
  end,
})
