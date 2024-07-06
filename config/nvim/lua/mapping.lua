require("plugins")

-- local gitsigns = require("gitsigns")

local wk = require("which-key")
wk.register({
    Q = {"<cmd>qa!<cr>", "Exit without saving"},
    q = {"<cmd>wq<cr>", "Exit with saving"},
    g = {
        name = "Git Signs",
        r = { "<cmd>Gitsigns refresh<cr>", "Refresh"},
        R = { "<cmd>Gitsigns reset_hunk<cr>", "Reset hunk"},
        n = { "<cmd>Gitsigns next_hunk<cr>", "Next hunk"},
        p = { "<cmd>Gitsigns prev_hunk<cr>", "Prev hunk"},
        b = { "<cmd>Gitsigns blame_line<cr>", "Blame line"},
        h = { "<cmd>Gitsigns preview_hunk_inline<cr>", "Preview hunk"},
        d = { "<cmd>Gitsigns diffthis<cr>", "Enable show difference"},
        D = {"<cmd>Gitsigns toggle_deleted<cr>", "Toggle deleted"},
        B = {"<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle current line blame"},
    },
    x = {"<cmd>bd<cr>", "Close buffer"},
    e = {"<cmd>NvimTreeToggle<cr>", "File tree"},
    b = {
        name = "Buffers",
        p = {"<Cmd>BufferPin<CR>", "Pin buffer"},
        c = {"<Cmd>BufferPick<CR>", "Pick buffer"},
        b = {"<Cmd>BufferOrderByBufferNumber<CR>", "Sort by number" },
        r = {"<Cmd>BufferRestore<CR>", "Restore buffers" },
        d = {"<Cmd>BufferOrderByDirectory<CR>", "Sort by directory" },
        l = {"<Cmd>BufferOrderByLanguage<CR>", "Sort by language" },
        w = {"<Cmd>BufferOrderByWindowNumber<CR>", "Sort by window number" },

    }

}, {prefix = "<leader>" })


local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<Tab>', '<Cmd>BufferNext<CR>', opts)
map('n', '<A-h>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A-l>', '<Cmd>BufferMoveNext<CR>', opts)

map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

