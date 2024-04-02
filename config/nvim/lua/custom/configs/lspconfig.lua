local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

lspconfig.clangd.setup({
	on_attach = function(client, bufnr)
		client.server_capabilities.signatureHelpProvider = false
		on_attach(client, bufnr)
	end,
	capabilities = capabilities,
})

lspconfig.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "python" },
})

local pyservers = {
	"pyright",
	"ruff_lsp",
}

for _, lsp in ipairs(pyservers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = { "python" },
	})
end

lspconfig.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "lua" },
})

lspconfig.cmake.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "cmake" },
})

-- local servers = { "lua_ls", "neocmake" }
--
-- for _, lsp in ipairs(servers) do
-- 	lspconfig[lsp].setup({
-- 		on_attach = on_attach,
-- 		capabilities = capabilities,
-- 	})
-- end
