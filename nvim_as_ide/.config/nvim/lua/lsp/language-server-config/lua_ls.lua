local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp") -- hrsh7th/cmp-nvim-lsp
if not cmp_nvim_lsp_ok then
	return
end

local capabilities = cmp_nvim_lsp.default_capabilities()

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lua_ls
local opts = {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	capabilities = capabilities,
	on_attach = require("lsp.lsp-opts").on_attach,
	flags = require("lsp.lsp-opts").flags,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT", -- 告诉服务器使用的Lua版本
			},
			diagnostics = {
				globals = { "vim" }, -- 让服务器认识vim全局变量
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true), -- 让服务器知道Neovim的运行时文件
				checkThirdParty = false,
			},
			telemetry = {
				enable = false,
			},
		},
	},
}

return {
	setup = function(server)
		server.setup(opts)
	end,
}
