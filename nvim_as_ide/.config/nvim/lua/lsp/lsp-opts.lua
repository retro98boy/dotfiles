local lsp_opts = {}

-- 针对当前缓冲区lsp加载后的按键映射
lsp_opts.on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true }
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", ":Lspsaga peek_definition<CR>", opts) -- 转到定义
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opts) -- 转到声明
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":Lspsaga lsp_finder<CR>", opts) -- 转到引用（包括定义）
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gy", ":lua vim.lsp.buf.type_definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", ":Lspsaga hover_doc<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", ":Lspsaga diagnostic_jump_next<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", ":Lspsaga diagnostic_jump_prev<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>rn", ":IncRename ", opts) -- inc-rename符号重命名
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>rn", ":Lspsaga rename<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>so", ":Lspsaga outline<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>ic", ":lua vim.lsp.buf.incoming_calls()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>oc", ":lua vim.lsp.buf.outgoing_calls()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>ca", ":Lspsaga code_action<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>f", ":lua vim.lsp.buf.format()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>wa", ":lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>wr", ":lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"<Leader>wl",
		":lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
		opts
	)
	-- if client.name == "tsserver" then
	-- 	vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>rf", ":TypescriptRenameFile<CR>", opts)
	-- 	vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>oi", ":TypescriptOrganizeImports<CR>", opts)
	-- 	vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>ru", ":TypescriptRemoveUnused<CR>", opts)
	-- end
end

lsp_opts.flags = {
	debounce_text_changes = 150,
}

return lsp_opts
