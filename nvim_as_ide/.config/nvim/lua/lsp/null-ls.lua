local null_ls_ok, null_ls = pcall(require, "null-ls")
if not null_ls_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#diagnostics
local diagnostics = null_ls.builtins.diagnostics
-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#completion
-- local completion = null_ls.builtins.completion

null_ls.setup({
	sources = {
		-- formatting.beautysh,
		formatting.clang_format,
		formatting.shfmt,
		formatting.stylua,
		diagnostics.clang_check,
		-- diagnostics.luacheck,
	},
})
