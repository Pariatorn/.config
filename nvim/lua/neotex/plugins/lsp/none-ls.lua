return {
	"nvimtools/none-ls.nvim", -- configure formatters & linters
	lazy = true,
	ft = { "py", "html", "js", "ts", "lua" },
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"jay-babu/mason-null-ls.nvim",
		"williamboman/mason.nvim",
		-- "MunifTanjim/prettier.nvim",
	},
	config = function()
		local mason_null_ls = require("mason-null-ls")
		mason_null_ls.setup({
			-- "prettier", -- prettier formatter
			"stylua", -- lua formatter
			"isort", -- python formatter
			"black", -- python formatter
			"ruff_lsp", -- python linter
			-- "pylint",   -- python linter
			-- "eslint_d", -- js linter
		})

		-- for conciseness
		local null_ls = require("null-ls")
		local null_ls_utils = require("null-ls.utils")
		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics

		-- configure null_ls
		null_ls.setup({
			-- add package.json as identifier for root (for typescript monorepos)
			root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
			-- setup formatters & linters
			sources = {
				--  to disable file types use
				--  "formatting.prettier.with({disabled_filetypes: {}})" (see null-ls docs)
				-- formatting.prettier.with({ TURN ON FOR JAVA SCRIPT
				--   extra_filetypes = { "svelte" },
				--   disabled_filetypes = { "txt" },
				-- }),                -- js/ts formatter
				formatting.stylua, -- lua formatter
				formatting.isort,
				formatting.black,
				-- diagnostics.pylint, -- ruff_lsp in usage
			},
		})
	end,
}
