return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  config = function()
    local catppuccin = require("catppuccin")
    catppuccin.setup({
      transparent_background = true,
      show_end_of_buffer = true,
      styles = {
        conditionals = {},
      }
    })
  end
}
