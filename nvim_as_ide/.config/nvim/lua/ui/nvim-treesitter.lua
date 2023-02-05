local nvim_treesitter_configs_ok, nvim_treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not nvim_treesitter_configs_ok then
	return
end

nvim_treesitter_configs.setup({
	-- :TSInstallInfo查看已安装的解释器
	-- all使能所有解释器
	ensure_installed = {
		"bash",
		"c",
		"cmake",
		"cpp",
		"cuda",
		"devicetree",
		"diff",
		"dockerfile",
		"help",
		"html",
		"json",
		"make",
		"markdown",
		"markdown_inline",
		"python",
		"rust",
		"vim",
		"yaml",
	},
	-- 同步安装解释器
	sync_install = false,
	-- 进入buffer时自动安装所有丢失的解释器
	auto_install = true,
	ignore_install = {},
	-- 高亮模块
	highlight = {
		enable = true,
		disable = {},
	},
	-- 增量选择模块
	incremental_selection = {
		enable = true,
		disable = {},
		keymaps = {
			-- 设置成false关闭一个按键映射
			init_selection = "<CR>",
			node_incremental = "<CR>",
			node_decremental = "<BS>",
			scope_incremental = "<Tab>", -- 可视模式使用
		},
	},
	-- 缩进模块(=)
	indent = {
		enable = true,
		disable = { "python" },
	},
	-- mrjones2014/nvim-ts-rainbow模块配置
	rainbow = {
		enable = true,
		disable = {},
		extended_mode = true, -- 高亮其他标签，类似html标签等，而不仅仅高亮括号
		max_file_lines = nil,
	},
})
