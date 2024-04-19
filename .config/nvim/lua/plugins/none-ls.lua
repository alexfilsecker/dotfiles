-- This plugin is for the formatings

return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"jay-babu/mason-null-ls.nvim",
	},

	config = function()
    require("mason-null-ls").setup({
      ensure_installed = {
        "prettier",
        "stylua",
        "eslint_d",
      }
    })

		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
			},
		})

		vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, {})
	end,
}
