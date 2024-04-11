-- This plugin allows me to highlight and color stuff

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function () 
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { 
        "lua",
        "javascript",
        "html",
        "css",
        "typescript",
      },
      sync_install = false,
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },  
    })
  end
}
