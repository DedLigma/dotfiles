local plugins = {
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = "mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		-- config = function()
		--   vim.g.mkdp_browser = { "vivaldi" }
		-- end,
	},
	{
		"rebelot/kanagawa.nvim",
	},
	-- {
	--   'bfrg/vim-cpp-modern',
	--   config = function()
	--     -- Вставьте настройки сюда
	--     vim.api.nvim_exec([[
	--       let g:cpp_function_highlight = 1
	--       let g:cpp_attributes_highlight = 1
	--       let g:cpp_member_highlight = 1
	--       let g:cpp_simple_highlight = 1
	--     ]], false)
	--   end
	-- },
	{
		"AckslD/swenv.nvim",
	},
	{
		"smoka7/multicursors.nvim",
		event = "VeryLazy",
		dependencies = {
			"smoka7/hydra.nvim",
		},
		opts = {},
		cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
		keys = {
			{
				mode = { "v", "n" },
				"<Leader>M",
				"<cmd>MCstart<cr>",
				desc = "Multicursor",
			},
		},
	},
	{
		"uga-rosa/ccc.nvim",
		config = function()
			local ccc = require("ccc")
			ccc.setup({
				highlighter = {
					auto_enable = true,
					lsp = true,
				},
			})
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			handlers = {},
		},
	},
	{
		"mfussenegger/nvim-dap",
		config = function(_, _)
			require("core.utils").load_mappings("dap")
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "VeryLazy",
		opts = function()
			return require("custom.configs.null-ls")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				--lsp
				"clangd",
				"pyright",
				"lua-language-server",
				"neocmakelsp",
				--dap
				"codelldb",
				"debugpy",
				--linters
				"mypy",
				"ruff",
				"selene",
				"cpplint",
				--formatters
				"clang-format",
				"black",
				"stylua",
				"gersemi",
				--linter formatter
				"cmakelang",
			},
		},
	},
}

return plugins
