-- This plugin is for the formatings

return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      null_ls.builtins.formatting.stylua,
    })

    vim.keymap.set('n', '<leader>fm', vim.lsp.buf.format, {})
  end
}