local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
	return
end

local servers = {
	bashls = require("lsp.language-server-config.bashls"),
	clangd = require("lsp.language-server-config.clangd"),
	lua_ls = require("lsp.language-server-config.lua_ls"),
	pyright = require("lsp.language-server-config.pyright"),
}

for name, config in pairs(servers) do
	config.setup(lspconfig[name])
end
