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
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

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
	use("nvim-lualine/lualine.nvim") -- 底部状态栏
	use({ "akinsho/bufferline.nvim", requires = { "nvim-tree/nvim-web-devicons" } }) -- 顶部buffer多标签
	use("famiu/bufdelete.nvim") -- 缓冲区关闭插件，避免自带的bdelete命令可能会导致窗口布局变乱的问题

	-- file
	use({ "nvim-tree/nvim-tree.lua", requires = { "nvim-tree/nvim-web-devicons" } })
	use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })

	-- edit
	use("nvim-treesitter/nvim-treesitter")
	use("windwp/nvim-autopairs") -- 自动输入括号对，可以搭配nvim-cmp、nvim-treesitter使用
	use("kylechui/nvim-surround") -- 成对修改""、''、()等
	use({ "mrjones2014/nvim-ts-rainbow", requires = { "nvim-treesitter/nvim-treesitter" } }) -- 基于nvim-treesitter的彩虹色括号对，没有单独Lua文件配置
	use("numToStr/Comment.nvim") -- 注释代码
	use("lukas-reineke/indent-blankline.nvim") -- 缩进指示线
	use("ggandor/leap.nvim") -- 光标跳转
	use("asiryk/auto-hlsearch.nvim") -- 搜索结果高亮自动处理

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
	use("neovim/nvim-lspconfig") -- 官方内置LSP快速配置
	use({ "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" } })
	use("j-hui/fidget.nvim") -- LSP处理过程显示
	use("smjonas/inc-rename.nvim") -- 实时显示的LSP符号重命名
	use("simrat39/symbols-outline.nvim") -- 符号大纲
	use({ "ldelossa/litee-calltree.nvim", requires = { "ldelossa/litee.nvim" } }) -- 符号调用树

	-- 如果packer.nvim下载成功，开始同步所有插件
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
