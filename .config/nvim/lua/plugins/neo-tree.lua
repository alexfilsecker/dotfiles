-- This plugin gives me the left sided file tree.

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim"
  },
  config = function()
    -- Reveal the tree at startup
    vim.api.nvim_command(":Neotree left reveal")

    vim.keymap.set('n', '<C-n>', ':Neotree left toggle<CR>')
  end
}
