local fn = vim.fn

-- 自动下载packer.nvim
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim" -- fn.stdpath("data")为~/.local/share/nvim
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- 保存此文件后Neovim会自动执行PackerSync
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]])

local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
	return
end

-- 让packer.nvim使用弹出窗口
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- 加载插件
return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	-- colorscheme
	use("tanvirtin/monokai.nvim")
	use("ellisonleao/gruvbox.nvim")
	use("projekt0n/github-nvim-theme")

	-- ui
	use("rcarriga/nvim-notify") -- 更美观的通知
	use({ "nvim-lualine/lualine.nvim", requires = { "nvim-tree/nvim-web-devicons" } }) -- 底部状态栏
	use({ "akinsho/bufferline.nvim", requires = { "nvim-tree/nvim-web-devicons" } }) -- 顶部多标签
	use("NvChad/nvim-colorizer.lua") -- 将缓冲区中的色值实时渲染
	use({ "folke/todo-comments.nvim", requires = { "nvim-lua/plenary.nvim" } }) -- 高亮显示注释中的TODO、FIX等
	use("nvim-treesitter/nvim-treesitter")
	use({ "mrjones2014/nvim-ts-rainbow", requires = { "nvim-treesitter/nvim-treesitter" } }) -- 基于nvim-treesitter的彩虹色括号对，没有单独Lua文件配置
	use("lukas-reineke/indent-blankline.nvim") -- 缩进指示线

	-- tool
	use({ "nvim-tree/nvim-tree.lua", requires = { "nvim-tree/nvim-web-devicons" } }) -- 文件管理
	use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } }) -- 模糊搜索
	use("akinsho/toggleterm.nvim") -- 浮动终端
	use("windwp/nvim-autopairs") -- 括号自动补全
	use("kylechui/nvim-surround") -- 成对修改""、''、()等
	use("numToStr/Comment.nvim") -- 注释代码
	use("ggandor/leap.nvim") -- 光标跳转
	use("asiryk/auto-hlsearch.nvim") -- 搜索结果高亮自动处理
	use("famiu/bufdelete.nvim") -- 缓冲区关闭插件，避免自带的bdelete命令可能会导致窗口布局变乱的问题

	-- cmp
	use("hrsh7th/nvim-cmp") -- Lua编写的Neovim补全引擎，补全源来自外部
	use({ "hrsh7th/cmp-buffer", requires = { "hrsh7th/nvim-cmp" } }) -- 缓冲区补全源
	use({ "hrsh7th/cmp-path", requires = { "hrsh7th/nvim-cmp" } }) -- 路径补全源
	use({ "hrsh7th/cmp-cmdline", requires = { "hrsh7th/nvim-cmp" } }) -- Vim的命令模式开启补全
	use({ "hrsh7th/cmp-nvim-lsp", requires = { "hrsh7th/nvim-cmp", "hrsh7th/cmp-nvim-lsp" } }) -- LSP补全源
	use({ "hrsh7th/cmp-nvim-lsp-signature-help", requires = { "hrsh7th/nvim-cmp" } }) -- LSP补全显示函数注释文档和函数签名
	use("folke/neodev.nvim") -- 完整的Neovim Lua API补全，正常使用需要补全引擎，如nvim-cmp
	use({ "saadparwaiz1/cmp_luasnip", requires = { "hrsh7th/nvim-cmp" } }) -- 代码片段补全源
	use("L3MON4D3/LuaSnip") -- Lua编写的Snippet引擎
	use("rafamadriz/friendly-snippets") -- 一些常用的代码片段

	-- lsp
	-- https://github.com/williamboman/mason-lspconfig.nvim#setup
	-- 加载顺序很重要：
	-- null-ls -> mason-null-ls
	-- mason-lspconfig -> nvim-lspconfig
	use({ "williamboman/mason.nvim" }) -- LSP、DAP、Formatter可执行文件安装
	use({ "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" } })
	use("jay-babu/mason-null-ls.nvim") -- 自动安装通过null-ls配置好的Formatter等
	use("williamboman/mason-lspconfig.nvim") -- 自动安装通过nvim-lspconfig配置好的服务器可执行文件
	use("neovim/nvim-lspconfig") -- 官方内置LSP快速配置
	use("j-hui/fidget.nvim") -- LSP处理过程显示
	-- use("smjonas/inc-rename.nvim") -- 实时显示的LSP符号重命名
	-- use("simrat39/symbols-outline.nvim") -- 符号大纲
	use({ "ldelossa/litee-calltree.nvim", requires = { "ldelossa/litee.nvim" } }) -- 符号调用树
	use({ "glepnir/lspsaga.nvim", requires = { "nvim-tree/nvim-web-devicons" } }) -- Neovim内置LSP增强

	-- debug

	-- 如果packer.nvim下载成功，开始同步所有插件
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
