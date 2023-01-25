-- Modes
-- normal_mode = "n",
-- insert_mode = "i",
-- visual_mode = "v",
-- visual_block_mode = "x",
-- term_mode = "t",
-- command_mode = "c",

-- 所有自定义按键映射包括插件的都在此设置，统一管理

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- 基础按键映射
map("i", "jj", "<Esc>", opts)
map("n", "<S-q>", "q", opts) --使用Q代替q录制按键宏
map("n", "q", "", opts) -- 取消原本的录制按键宏快捷键q
map("n", "<Leader>w", ":wa!<CR>", opts)
map("n", "<Leader>x", ":q!<CR>", opts)

-- 窗口分割
map("n", "<Leader>/", ":vsplit<CR>", opts)
map("n", "<Leader>-", ":split<CR>", opts)

-- 窗口导航
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- 窗口大小缩放
map("n", "<A-k>", ":resize -2<CR>", opts)
map("n", "<A-j>", ":resize +2<CR>", opts)
map("n", "<A-h>", ":vertical resize -2<CR>", opts)
map("n", "<A-l>", ":vertical resize +2<CR>", opts)

-- 多行文本上下移动
map("v", "<S-k>", ":m '<-2<CR>gv=gv", opts)
map("v", "<S-j>", ":m '>+1<CR>gv=gv", opts)

-- 翻页
map("n", "<C-u>", "10k", opts)
map("n", "<C-d>", "10j", opts)

-- buffer导航
map("n", "<A-/>", ":Bdelete!<CR>", opts)
map("n", "<A-,>", ":bprevious<CR>", opts)
map("n", "<A-.>", ":bnext<CR>", opts)

-- 插件按键映射
local plugin_keymaps = {}

-- nvim-tree
map("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)

-- telescope
map("n", "<Leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<Leader>fg", ":Telescope live_grep<CR>", opts)
map("n", "<Leader>fb", ":Telescope buffers<CR>", opts)
map("n", "<Leader>fh", ":Telescope help_tags<CR>", opts)

-- nvim-treesitter
map("n", "z", "zc", opts)
plugin_keymaps.nvim_treesitter_map = function(treesitter_configs)
	treesitter_configs.setup({
		-- 增量选择模块
		incremental_selection = {
			enable = true,
			keymaps = {
				-- 设置成false关闭一个按键映射
				init_selection = "<CR>",
				node_incremental = "<CR>",
				node_decremental = "<BS>",
				scope_incremental = "<Tab>", -- 可视模式使用
			},
		},
	})
end

-- comment
plugin_keymaps.comment_map = function(comment)
	comment.setup({
		-- NORMAL模式下按键映射
		toggler = {
			line = "gcc",
			block = "gbc",
		},
		-- O-PENDING模式下按键映射
		opleader = {
			line = "gc",
			block = "gb",
		},
		-- 额外按键映射
		extra = {
			above = "gcO", -- 当前行上面添加注释
			below = "gco", -- 当前行下面添加注释
			eol = "gcA", -- 行尾添加注释
		},
		-- 按键绑定开关
		mappings = {
			basic = true, -- 如果为false，gcc gbc gc[count]{motion} gb[count]{motion}等按键不会工作
			extra = true, -- 如果为false，gco, gcO, gcA等按键不会工作
		},
	})
end

-- nvim-cmp
plugin_keymaps.cmp_map = function(cmp, luasnip)
	local check_backspace = function()
		local col = vim.fn.col(".") - 1
		return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
	end
	cmp.setup({
		mapping = cmp.mapping.preset.insert({
			["<C-p>"] = cmp.mapping.select_prev_item(),
			["<C-n>"] = cmp.mapping.select_next_item(),
			["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
			["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
			["<C-r>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
			["<C-c>"] = cmp.mapping({
				i = cmp.mapping.abort(),
				c = cmp.mapping.close(),
			}),
			-- Accept currently selected item. If none selected, `select` first item.
			-- Set `select` to `false` to only confirm explicitly selected items.
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expandable() then
					luasnip.expand()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				elseif check_backspace() then
					fallback()
				else
					fallback()
				end
			end, {
				"i",
				"s",
			}),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, {
				"i",
				"s",
			}),
		}),
	})
end

-- nvim-lspconfig
plugin_keymaps.lsp_map = function(map_func)
	local map_opts = { noremap = true, silent = true }
	map_func("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", map_opts) -- 转到声明
	map_func("n", "gd", ":lua vim.lsp.buf.definition()<CR>", map_opts) -- 转到定义
	map_func("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", map_opts) -- 转到实现
	map_func("n", "gr", ":lua vim.lsp.buf.references()<CR>", map_opts) -- 转到引用
	map_func("n", "gy", ":lua vim.lsp.buf.type_definition()<CR>", map_opts)
	map_func("n", "K", ":lua vim.lsp.buf.hover()<CR>", map_opts) -- 显示函数文档
	-- map_func("n", "<C-k>", ":lua vim.lsp.buf.signature_help()<CR>", map_opts)
	-- map_func("n", "<Leader>rn", ":lua vim.lsp.buf.rename()<CR>", map_opts) -- 符号重命名
	map_func("n", "<Leader>rn", ":IncRename ", map_opts) -- inc-rename符号重命名
	map_func("n", "<Leader>wa", ":lua vim.lsp.buf.add_workspace_folder()<CR>", map_opts)
	map_func("n", "<Leader>wr", ":lua vim.lsp.buf.remove_workspace_folder()<CR>", map_opts)
	map_func("n", "<Leader>wl", ":lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", map_opts)
	map_func("n", "<Leader>ca", ":lua vim.lsp.buf.code_action()<CR>", map_opts)
	map_func("n", "<Leader>f", ":lua vim.lsp.buf.format()<CR>", map_opts) -- null-ls
end

return plugin_keymaps
