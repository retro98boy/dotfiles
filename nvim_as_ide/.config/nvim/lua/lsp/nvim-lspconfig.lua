local lspconfig = require("lspconfig")

local servers = {
	bashls = require("lsp.language-server-config.bashls"),
	clangd = require("lsp.language-server-config.clangd"),
	sumneko_lua = require("lsp.language-server-config.sumneko_lua"),
}

for name, config in pairs(servers) do
	if config ~= nil and type(config) == "table" then
		config.setup(lspconfig[name])
	else
		lspconfig[name].setup({})
	end
end
