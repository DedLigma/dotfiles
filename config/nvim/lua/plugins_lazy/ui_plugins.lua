-- local function is_modified_buffer_open(buffers)
--     for _, v in pairs(buffers) do
--         if v.name:match("NvimTree_") == nil then
--             return true
--         end
--     end
--     return false
-- end

-- vim.api.nvim_create_autocmd("BufEnter", {
    -- nested = true,
    -- callback = function()
    --     if
    --         #vim.api.nvim_list_wins() == 1
    --         and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil
    --         and is_modified_buffer_open(vim.fn.getbufinfo({ bufmodified = 1 })) == false
    --     then
    --         vim.cmd("quit")
    --     end
    -- end,
-- })

return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = maps,
    },
    {
        'nvim-tree/nvim-web-devicons'
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup({})
        end,
    },
    {
        'rktjmp/lush.nvim'
    },
    {
        'uloco/bluloco.nvim',
        lazy = false,
        priority = 1000,
        dependencies = { 'rktjmp/lush.nvim' },
        config = function()
            require("bluloco").setup({
                style       = "auto", -- "auto" | "dark" | "light"
                transparent = false,
                italics     = false,
                terminal    = vim.fn.has("gui_running") == 1, -- bluoco colors are enabled in gui terminals per default.
                guicursor   = true,
            })

            vim.opt.termguicolors = true
            vim.cmd('colorscheme bluloco')
        end,
    },
    {
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
            animation = true,
            tabpages = true,
            clickable = true,
            focus_on_close = 'right',
            icons = {
                -- Configure the base icons on the bufferline.
                -- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
                buffer_index = true,
                buffer_number = false,


                gitsigns = {
                    added = { enabled = false, icon = '+' },
                    changed = { enabled = false, icon = '~' },
                    deleted = { enabled = false, icon = '-' },
                },
                filetype = {
                    custom_colors = false,
                    enabled = true,
                },
            },
            sidebar_filetypes = {
                -- Use the default values: {event = 'BufWinLeave', text = '', align = 'left'}
                NvimTree = true,
                -- Or, specify the text used for the offset:
                undotree = {
                    text = 'undotree',
                    align = 'center', -- *optionally* specify an alignment (either 'left', 'center', or 'right')
                },
                -- Or, specify the event which the sidebar executes when leaving:
                ['neo-tree'] = { event = 'BufWipeout' },
                -- Or, specify all three
                Outline = { event = 'BufWinLeave', text = 'symbols-outline', align = 'right' },
            },
        },
        version = '^1.0.0',
    },

}

