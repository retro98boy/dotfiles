local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
	return
end

local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then
	return
end

local mason_null_ls_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_ok then
	return
end

mason.setup({})

mason_lspconfig.setup({
	-- 需要安装的列表
	ensure_installed = {
		-- "bashls",
		-- "clangd",
		-- "sumneko_lua",
	},
	automatic_installation = false, -- 是否自动安装通过nvim-lspconfig配置好的服务器，和上面选项无关
})

mason_null_ls.setup({
	-- 需要安装的列表
	ensure_installed = {},
	automatic_installation = false, -- 是否自动安装通过null-ls配置好的Formatter等，和上面选项无关
})
