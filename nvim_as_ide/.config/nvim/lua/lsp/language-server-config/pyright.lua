local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp") -- hrsh7th/cmp-nvim-lsp
if not cmp_nvim_lsp_ok then
	return
end

local capabilities = cmp_nvim_lsp.default_capabilities()

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pyright
local opts = {
	cmd = { "pyright-langserver", "--stdio" },
	filetypes = { "python" },
	capabilities = capabilities,
	on_attach = require("lsp.lsp-opts").on_attach,
	flags = require("lsp.lsp-opts").flags,
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "workspace",
				useLibraryCodeForTypes = true,
			},
		},
	},
}

return {
	setup = function(server)
		server.setup(opts)
	end,
}
