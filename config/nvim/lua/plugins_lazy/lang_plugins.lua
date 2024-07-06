local plugins_list = {
    {
        "williamboman/mason.nvim",
        opts = {
			ensure_installed = {
				--lsp
				"clangd",                   --cpp
				"lua-language-server",      --lua
				"cmake-language-server",    ---cmake
				--linters
				"selene",       --lua
				"cpplint",      --cpp
				--formatters
				"clang-format", ---cpp
				"stylua",       --lua
				"gersemi",      --cmake
				--linter formatter
				"cmakelang",    --cmake
			},
		},
    },
    {
        "neovim/nvim-lspconfig",
    },
    {
        "williamboman/mason-lspconfig.nvim",
    },

    {
        "mhartington/formatter.nvim",
    },
    {
        "mfussenegger/nvim-lint",
    },

}



return plugins_list