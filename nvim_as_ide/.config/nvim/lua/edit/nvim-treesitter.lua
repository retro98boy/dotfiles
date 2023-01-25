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
	-- 忽略安装的解释器
	-- ignore_install = { "java" },
	-- 高亮选择模块
	highlight = {
		enable = true,
		-- 禁止高亮的解释器
		-- disable = { "java" },
		-- 禁止大文件的高亮
		disable = function(lang, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
	},
	-- 缩进模块(=)
	indent = {
		enable = true,
		-- 禁止使用缩进的解释器
		-- disable = { "python", "css" }
	},
	-- nvim-ts-rainbow模块配置
	rainbow = {
		enable = true,
		-- 禁止使用彩虹括号的解释器
		-- disable = { "java" }
		-- 高亮其他标签，类似html标签等，而不仅仅高亮括号
		extended_mode = true,
		-- 不高亮超过一定行数的文件
		max_file_lines = nil,
	},
})

-- 折叠代码
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false -- 默认不要自动折叠
vim.opt.foldlevel = 99

require("keymaps").nvim_treesitter_map(nvim_treesitter_configs)
