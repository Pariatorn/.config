return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- used to enable autocompletion (assign to every lsp server config)
		local default = cmp_nvim_lsp.default_capabilities()

		local util = require("lspconfig/util")

		-- Change the Diagnostic symbols in the sign column (gutter)
		local signs = { Error = "", Warn = "", Hint = "󰠠", Info = "" }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- -- configure html server
		-- lspconfig["html"].setup({
		--   capabilities = default,
		-- })

		-- -- configure typescript server with plugin
		-- lspconfig["tsserver"].setup({
		--   capabilities = default,
		-- })

		-- -- configure emmet language server
		-- lspconfig["emmet_ls"].setup({
		--   capabilities = default,
		--   filetypes = { "html", "typescriptreact", "javascriptreact" }, -- , "css", "sass", "scss", "less", "svelte"
		-- })

		-- configure python server with ruff diagnostics
		lspconfig["pyright"].setup({
			capabilities = default,
			settings = {
				pyright = {
					disableOrganizeImports = true,
				},
				python = {
					analysis = {
						ignore = { "*" },
					},
				},
			},
		})

		lspconfig["ruff_lsp"].setup({
			capabilities = default,
		})

		-- configure lua server (with special settings)
		lspconfig["lua_ls"].setup({
			capabilities = default,
			settings = {
				-- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		lspconfig["yamlls"].setup({
			settings = {
				yaml = {
					validate = true,
					schemaStore = {
						enable = false,
						url = "",
					},
					schemas = {
						["https://json.schemastore.org/kustomization.json"] = "kustomization.{yml,yaml}",
						["https://raw.githubusercontent.com/docker/compose/master/compose/config/compose_spec.json"] = "docker-compose*.{yml,yaml}",
						["https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/argoproj.io/application_v1alpha1.json"] = "argocd-application.yaml",
					},
				},
			},
		})

		lspconfig["rust_analyzer"].setup({
			capabilities = default,
			filetypes = { "rust" },
			root_dir = util.root_pattern("Cargo.toml"),
			settings = {
				["rust_analyzer"] = {
					cargo = {
						allFeatures = true,
					},
				},
			},
		})
	end,
}
