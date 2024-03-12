-- Modes
-- normal_mode = "n",
-- insert_mode = "i",
-- visual_mode = "v",
-- visual_block_mode = "x",
-- term_mode = "t",
-- command_mode = "c",

-- vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- 关闭LazyVim自带的悬浮终端快捷键
map("n", "<Leader>ft", "<Nop>", opts)
map("n", "<Leader>fT", "<Nop>", opts)
map("n", "<C-/>", "<Nop>", opts)
map("t", "<C-/>", "<Nop>", opts)
map("t", "<C-k>", "<C-k>", opts)
map("t", "<C-j>", "<C-j>", opts)
map("t", "<C-h>", "<C-h>", opts)
map("t", "<C-l>", "<C-l>", opts)

map("i", "jj", "<Esc>", opts)

-- 使用Q代替q录制按键宏
map("n", "<S-q>", "q", opts)
map("n", "q", "<Nop>", opts)

-- 光标快速移动
map("n", "<S-k>", "10k", opts)
map("n", "<S-j>", "10j", opts)
map("n", "<S-h>", "^", opts) -- 跳到行首非空白字符
-- map("n", "<S-h>", "0", opts) -- 跳到行首
map("n", "<S-l>", "$", opts)
map("v", "<S-k>", "10k", opts)
map("v", "<S-j>", "10j", opts)
map("v", "<S-h>", "^", opts) -- 跳到行首非空白字符
-- map("v", "<S-h>", "0", opts) -- 跳到行首
map("v", "<S-l>", "$", opts)

-- 插入模式下移动光标
map("i", "<C-k>", "<Up>", opts)
map("i", "<C-j>", "<Down>", opts)
map("i", "<C-h>", "<Left>", opts)
map("i", "<C-l>", "<Right>", opts)
