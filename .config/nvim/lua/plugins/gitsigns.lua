-- This plugin is for visually seing git things like blame and hunks

return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup()

    -- Keymaps
    vim.keymap.set('n', '<leader>gp', ':Gitsigns preview_hunk<CR>')
  end
}
