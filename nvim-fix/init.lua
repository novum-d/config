-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.api.nvim_set_keymap("i", "jj", "<esc>", { noremap = true, silent = true })

-- require("luasnip.loaders.from_vscode").lazy_load({ paths = "./lua/snip/snippets/" })
vim.g.rustfmt_autosave = 1
-- local cmp = require("cmp")
-- cmp.setup({
--   sources = cmp.config.sources({
--     { name = "nvim_lsp" },
--   }, {
--     { name = "buffer" },
--   }),
-- })
