return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        opts = {
            ensure_installed = { "bash", "c", "cpp", "cmake", "doxygen", "gitignore", "json", "lua", "make", "python" },
        },
    },
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        -- keys = {
        --     {
        --         -- Customize or remove this keymap to your liking
        --         "<leader>f",
        --         function()
        --             require("conform").format({ async = true, lsp_fallback = true })
        --         end,
        --         mode = "",
        --         desc = "Format buffer",
        --     },
        -- },
        -- Everything in opts will be passed to setup()
        opts = {
            -- Define your formatters
            formatters_by_ft = {
                lua = { "stylua" },
            },
            -- Set up format-on-save
            -- format_on_save = { timeout_ms = 500, lsp_fallback = true },
            -- Customize formatters
        },
        init = function()
            -- If you want the formatexpr, here is the place to set it
            vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
        end,
    },
    
}