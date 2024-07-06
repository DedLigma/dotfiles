local lang_plugins = require("plugins_lazy.lang_plugins")

require("mason").setup()
require("mason-lspconfig").setup()

require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
    end,
    -- Next, you can provide a dedicated handler for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
}

-- Подключаем плагин formatter.nvim
local formatter = require('formatter')

-- Настройка плагина для использования встроенных форматтеров
formatter.setup({
  filetype = {
    cpp = {
      function()
        return {
          exe = "clang-format",
          args = {},
          stdin = true
        }
      end
    },
    c = {
      function()
        return {
          exe = "clang-format",
          args = {},
          stdin = true
        }
      end
    },
    lua = {
      function()
        return {
          exe = "stylua",
          args = {"-"},
          stdin = true
        }
      end
    },
    ["*"] = {
        -- "formatter.filetypes.any" defines default configurations for any
        -- filetype
        require("formatter.filetypes.any").remove_trailing_whitespace
      }
  }
})

-- -- Настройка автоматического форматирования при сохранении файла
-- vim.api.nvim_exec([[
--   augroup FormatAutogroup
--     autocmd!
--     autocmd BufWritePost *.cpp,*.lua FormatWrite
--   augroup END
-- ]], true)

