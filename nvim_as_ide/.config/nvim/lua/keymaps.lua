-- Modes
-- normal_mode = "n",
-- insert_mode = "i",
-- visual_mode = "v",
-- visual_block_mode = "x",
-- term_mode = "t",
-- command_mode = "c",

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("i", "jj", "<Esc>", opts)
map("n", "<S-q>", "q", opts) -- 使用Q代替q录制按键宏
map("n", "q", "<Nop>", opts) -- 取消原本的录制按键宏快捷键q
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

-- 插入模式下移动光标
map("i", "<C-k>", "<Up>", opts)
map("i", "<C-j>", "<Down>", opts)
map("i", "<C-h>", "<Left>", opts)
map("i", "<C-l>", "<Right>", opts)

-- 光标快速移动
map("n", "<S-k>", "8k", opts)
map("n", "<S-j>", "8j", opts)
map("n", "<S-h>", "^", opts) -- 跳到行首非空白字符
-- map("n", "<S-h>", "0", opts) -- 跳到行首
map("n", "<S-l>", "$", opts)
map("v", "<S-k>", "8k", opts)
map("v", "<S-j>", "8j", opts)
map("v", "<S-h>", "^", opts) -- 跳到行首非空白字符
-- map("v", "<S-h>", "0", opts) -- 跳到行首
map("v", "<S-l>", "$", opts)

-- 窗口大小缩放
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- 插入模式下的Emacs按键绑定
map("i", "<C-p>", "<Up>", opts)
map("i", "<C-n>", "<Down>", opts)
map("i", "<C-b>", "<Left>", opts)
map("i", "<C-f>", "<Right>", opts)
map("i", "<C-a>", "<Home>", opts)
map("i", "<C-e>", "<End>", opts)

-- buffer导航
map("n", "<A-/>", ":Bdelete!<CR>", opts)
map("n", "<A-,>", ":bprevious<CR>", opts)
map("n", "<A-.>", ":bnext<CR>", opts)

-- 部分插件按键映射

-- nvim-tree
map("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)
map("n", "<Leader>ef", ":NvimTreeFindFile<CR>", opts)

-- telescope
map("n", "<Leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<Leader>fg", ":Telescope live_grep<CR>", opts)
map("n", "<Leader>fs", ":Telescope lsp_dynamic_workspace_symbols<CR>", opts)
map("n", "<Leader>fb", ":Telescope buffers<CR>", opts)
map("n", "<Leader>fh", ":Telescope help_tags<CR>", opts)
