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
local opt = { noremap = true, silent = true }

map("i", "jj", "<Esc>", opt)

-- 使用Q代替q录制按键宏
map("n", "<S-q>", "q", opt)
map("n", "q", "<Nop>", opt)

-- 光标快速移动
map("n", "<S-k>", "10k", opt)
map("n", "<S-j>", "10j", opt)
-- map("n", "<S-h>", "^", opt) -- 跳到行首非空白字符
-- map("n", "<S-h>", "0", opt) -- 跳到行首
-- map("n", "<S-l>", "$", opt)
map("v", "<S-k>", "10k", opt)
map("v", "<S-j>", "10j", opt)
-- map("v", "<S-h>", "^", opt) -- 跳到行首非空白字符
-- map("v", "<S-h>", "0", opt) -- 跳到行首
-- map("v", "<S-l>", "$", opt)

-- 插入模式下移动光标
map("i", "<C-k>", "<Up>", opt)
map("i", "<C-j>", "<Down>", opt)
map("i", "<C-h>", "<Left>", opt)
map("i", "<C-l>", "<Right>", opt)
