-- This plugin gives me the tab like look of all my open buffers.

return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require("bufferline").setup()

    -- Keymaps for cycling through buffers
    vim.keymap.set('n', 'H', vim.cmd.BufferLineCyclePrev)
    vim.keymap.set('n', 'L', vim.cmd.BufferLineCycleNext)
  end
}
