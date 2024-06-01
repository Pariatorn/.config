return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 200
	end,
	opts = {
		setup = {
			show_help = true,
			plugins = {
				presets = {
					operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
					motions = false, -- adds help for motions
					text_objects = false, -- help for text objects triggered after entering an operator
					windows = false, -- default bindings on <c-w>
					nav = false, -- misc bindings to work with windows
					z = false, -- bindings for folds, spelling and others prefixed with z
					g = false, -- bindings for prefixed with g
					marks = false, -- shows a list of your marks on ' and `
					registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
					spelling = {
						enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
						suggestions = 10, -- how many suggestions should be shown in the list?
					},
					-- the presets plugin, adds help for a bunch of default keybindings in Neovim
					-- No actual key bindings are created
				},
			},
			key_labels = {
				-- override the label used to display some keys. It doesn't effect WK in any other way.
				-- For example:
				-- ["<space>"] = "SPC",
				-- ["<CR>"] = "RET",
				-- ["<tab>"] = "TAB",
			},
			-- triggers = "auto", -- automatically setup triggers
			triggers = { "<leader>" }, -- or specify a list manually
			-- add operators that will trigger motion and text object completion
			-- to enable native operators, set the preset / operators plugin above
			-- operators = { gc = "Comments" },
			icons = {
				breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
				separator = "➜", -- symbol used between a key and it's label
				group = "+", -- symbol prepended to a group
			},
			popup_mappings = {
				scroll_down = "<c-d>", -- binding to scroll down inside the popup
				scroll_up = "<c-u>", -- binding to scroll up inside the popup
			},
			window = {
				border = "rounded", -- none, single, double, shadow
				position = "bottom", -- bottom, top
				margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
				padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
				winblend = 0,
				zindex = 1000, -- positive value to position WhichKey above other floating windows.
			},
			layout = {
				height = { min = 4, max = 25 }, -- min and max height of the columns
				width = { min = 20, max = 50 }, -- min and max width of the columns
				spacing = 3, -- spacing between columns
				align = "left", -- align columns left, center or right
			},
			ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
			hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
			triggers_nowait = {},
			triggers_blacklist = {
				-- list of mode / prefixes that should never be hooked by WhichKey
				-- this is mostly relevant for key maps that start with a native binding
				-- most people should not need to change this
				i = { "j", "k" },
				v = { "j", "k" },
			},
			-- disable the WhichKey popup for certain buf types and file types.
			-- Disabled by default for Telescope
			disable = {
				buftypes = {},
				filetypes = {},
			},
		},
		defaults = {
			buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
			silent = true, -- use `silent` when creating keymaps
			noremap = true, -- use `noremap` when creating keymaps
			nowait = true, -- use `nowait` when creating keymaps
			prefix = "<leader>",
			mode = { "n", "v" },
			b = { "<cmd>VimtexCompileSS<CR>", "build" },
			c = { "<cmd>vert sb<CR>", "create split" },
			d = { "<cmd>update! | bdelete!<CR>", "delete buffer" },
			e = { "<cmd>NvimTreeToggle<CR>", "explorer" },
			j = { "<cmd>clo<CR>", "drop split" },
			i = { "<cmd>VimtexTocOpen<CR>", "index" },
			k = { "<cmd>on<CR>", "max split" },
			q = { "<cmd>wa! | qa!<CR>", "quit" },
			u = { "<cmd>Telescope undo<CR>", "undo" },
			v = { "<cmd>VimtexView<CR>", "view" },
			w = { "<cmd>wa!<CR>", "write" },
			a = {
				name = "ACTIONS",
				a = { "<cmd>lua PdfAnnots()<CR>", "annotate" },
				b = { "<cmd>terminal bibexport -o %:p:r.bib %:p:r.aux<CR>", "bib export" },
				c = { "<cmd>:VimtexClearCache All<CR>", "clear vimtex" },
				e = { "<cmd>e ~/.config/nvim/snippets/tex.snippets<CR>", "edit snippets" },
				f = { "<cmd>lua vim.lsp.buf.format()<CR>", "format" },
				-- g = { "<cmd>e ~/.config/nvim/templates/Glossary.tex<CR>", "edit glossary" },
				h = { "<cmd>LocalHighlightToggle<CR>", "highlight" },
				k = { "<cmd>VimtexClean<CR>", "kill aux" },
				p = { "<cmd>TermExec cmd='python3 %:p:r.py'<CR>", "python" },

				r = { "<cmd>VimtexErrors<CR>", "report errors" },
				u = { "<cmd>cd %:p:h<CR>", "update cwd" },
				v = { "<plug>(vimtex-context-menu)", "vimtex menu" },
				w = { "<cmd>VimtexCountWords!<CR>", "word count" },
			},
			f = {
				name = "FIND",
				b = {
					"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<CR>",
					"buffers",
				},
				c = { "<cmd>Telescope bibtex format_string=\\citet{%s}<CR>", "citations" },
				f = { "<cmd>Telescope live_grep theme=ivy<CR>", "project" },
				g = { "<cmd>Telescope git_commits<CR>", "git history" },
				h = { "<cmd>Telescope help_tags<CR>", "help" },
				k = { "<cmd>Telescope keymaps<CR>", "keymaps" },
				r = { "<cmd>Telescope registers<CR>", "registers" },
				t = { "<cmd>Telescope colorscheme<CR>", "theme" },
				w = { "<cmd>lua SearchWordUnderCursor()<CR>", "word" },
				y = { "<cmd>YankyRingHistory<CR>", "yanks" },
			},
			g = {
				name = "GIT",
				b = { "<cmd>Telescope git_branches<CR>", "checkout branch" },
				d = { "<cmd>Gitsigns diffthis HEAD<CR>", "diff" },
				g = { "<cmd>LazyGit<CR>", "lazygit" },
				k = { "<cmd>Gitsigns prev_hunk<CR>", "prev hunk" },
				j = { "<cmd>Gitsigns next_hunk<CR>", "next hunk" },
				l = { "<cmd>Gitsigns blame_line<CR>", "line blame" },
				p = { "<cmd>Gitsigns preview_hunk<CR>", "preview hunk" },
				t = { "<cmd>Gitsigns toggle_current_line_blame<CR>", "toggle blame" },
			},
			L = {
				name = "LIST",
				c = { "<cmd>lua HandleCheckbox()<CR>", "checkbox" },
				n = { "<cmd>AutolistCycleNext<CR>", "next" },
				p = { "<cmd>AutolistCyclePrev<CR>", "previous" },
				r = { "<cmd>AutolistRecalculate<CR>", "reorder" },
			},
			l = {
				name = "LSP",
				b = { "<cmd>Telescope diagnostics bufnr=0<CR>", "buffer diagnostics" },
				c = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "code action" },
				d = { "<cmd>Telescope lsp_definitions<CR>", "definition" },
				D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "declaration" },
				h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "help" },
				i = { "<cmd>Telescope lsp_implementations<CR>", "implementations" },
				k = { "<cmd>LspStop<CR>", "kill lsp" },
				l = { "<cmd>lua vim.diagnostic.open_float()<CR>", "line diagnostics" },
				n = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "next diagnostic" },
				p = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "previous diagnostic" },
				r = { "<cmd>Telescope lsp_references<CR>", "references" },
				s = { "<cmd>LspRestart<CR>", "restart lsp" },
				t = { "<cmd>LspStart<CR>", "start lsp" },
				R = { "<cmd>lua vim.lsp.buf.rename()<CR>", "rename" },
			},
			m = {
				name = "MARKDOWN",
				v = { "<cmd>TermExec cmd='okular %:p:r.md'<CR>", "view document" },
			},
			S = {
				name = "SESSIONS",
				s = { "<cmd>SessionManager save_current_session<CR>", "save" },
				d = { "<cmd>SessionManager delete_session<CR>", "delete" },
				l = { "<cmd>SessionManager load_session<CR>", "load" },
			},
			p = {
				name = "PANDOC",
				w = { "<cmd>TermExec cmd='pandoc %:p -o %:p:r.docx'<CR>", "word" },
				m = { "<cmd>TermExec cmd='pandoc %:p -o %:p:r.md'<CR>", "markdown" },
				h = { "<cmd>TermExec cmd='pandoc %:p -o %:p:r.html'<CR>", "html" },
				l = { "<cmd>TermExec cmd='pandoc %:p -o %:p:r.tex'<CR>", "latex" },
				p = { "<cmd>TermExec cmd='pandoc %:p -o %:p:r.pdf' open=0<CR>", "pdf" },
				v = { "<cmd>TermExec cmd='zathura %:p:r.pdf &' open=0<CR>", "view" },
			},
			s = {
				name = "SURROUND",
				s = { "<Plug>(nvim-surround-normal)", "surround" },
				d = { "<Plug>(nvim-surround-delete)", "delete" },
				c = { "<Plug>(nvim-surround-change)", "change" },
			},
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts.setup)
		wk.register(opts.defaults)
	end,
}
