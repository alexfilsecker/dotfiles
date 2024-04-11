-- Here I'll place all LSP related plugins

return {
  {
    -- This plugin helps me manage my LSP, DAP, Formaters and Linters
    -- To use it just enter the ui by :Mason
    "williamboman/mason.nvim",
    config = true
  },

  {
    -- This plugin closes gaps between mason and lspconfig.
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = {
          'lua_ls'
        }
      })
    end
  },

  {
    -- This is where the actual lsp is being configured
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- Server specific things
      lspconfig.lua_ls.setup({})

      -- keymaps
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}
