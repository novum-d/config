return {
  {
    "mhanberg/elixir.nvim",
    ft = { "elixir", "eex", "heex", "surface" },
    config = function()
      local elixir = require("elixir")

      elixir.setup({
        settings = elixir.settings({
          dialyzerEnabled = false,
          enableTestLenses = false,
        }),
        log_level = vim.lsp.protocol.MessageType.Log,
        message_level = vim.lsp.protocol.MessageType.Log,
        on_attach = function(client, bufnr)
          -- whatever keybinds you want, see below for more suggestions
          vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
          vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
          vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
        end,
      })
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}
