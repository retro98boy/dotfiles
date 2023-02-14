require("options") -- Vim选项
require("keymaps") -- 按键映射
require("plugins") -- 加载插件
require("colorscheme") -- 设置配色
-- ui
require("ui.nvim-notify")
require("ui.lualine")
require("ui.bufferline")
require("ui.nvim-colorizer")
require("ui.todo-comments")
require("ui.nvim-treesitter")
require("ui.indent-blankline")
-- tool
require("tool.nvim-tree")
require("tool.telescope")
require("tool.toggleterm")
require("tool.nvim-autopairs")
require("tool.nvim-surround")
require("tool.comment")
require("tool.leap")
require("tool.auto-hlsearch")
require("tool.mini-move")
-- cmp
require("cmp.nvim-cmp")
require("cmp.neodev")
-- lsp
-- https://github.com/williamboman/mason-lspconfig.nvim#setup
-- 加载顺序很重要：
-- null-ls -> mason-null-ls
-- mason-lspconfig -> nvim-lspconfig
require("lsp.null-ls")
require("lsp.mason")
require("lsp.nvim-lspconfig")
require("lsp.fidget")
-- require("lsp.inc-rename") -- 被glepnir/lspsaga.nvim替代
require("lsp.litee")
require("lsp.litee-calltree")
require("lsp.lspsaga")
-- debug
