-- backup writebackup  action
-- off       off        no backup made
-- off       on         backup current file, deleted afterwards (default)
-- on        off        delete old backup, backup current file
-- on        on         delete old backup, backup current file
local opt = vim.opt
opt.writebackup = false
opt.backup = false
opt.swapfile = false -- 不创建交换文件
opt.undofile = true -- 生成undofile，编辑文件可以undo到上次编辑的状态
opt.autoread = true -- 文件被其他编辑器修改后，会自动重载
opt.number = true -- 开启行号
opt.relativenumber = true -- 开启相对行号
opt.numberwidth = 2 -- 行号列的宽度
opt.wrap = true -- 开启自动换行
opt.linebreak = true -- 和wrap搭配使用，自动换行时不拆词
opt.cmdheight = 2 -- 下方cmd界面高度
opt.signcolumn = "yes" -- 总是显示左侧符号列，一些插件使用到，例如断点调试符号
opt.showtabline = 2 -- 总是在顶部显示tab栏
opt.showmode = false -- 禁用内置的底部模式显示，类似-- INSERT --
opt.pumheight = 10 -- 弹出窗口大小
opt.splitbelow = true -- 垂直分割时，新窗口从上面出现
opt.splitright = true -- 水平分割时，新窗口从右边出现
opt.cursorline = true -- 高亮当前行
opt.cursorcolumn = true -- 高亮当前列
opt.scrolloff = 8 -- 光标上下移动时，上边和下边保留的行数，继续移动光标开始滚屏
opt.sidescrolloff = 8 -- 光标左右移动时，左边和右边保留的行数，继续移动光标开始滚屏
opt.whichwrap = "<,>,[,],h,l" -- 光标在行首/行尾时哪些横向移动的按键可以跳到上/下一行
opt.mouse:append("a") -- 任何模式下启用鼠标
opt.ignorecase = true -- 搜索时忽略大小写
opt.smartcase = true -- 智能判断是否在搜索时忽略大小写，在ignorecase为true时有效；忽略大小写后，几乎都使用全小写搜索，这时搜索输入中有大写，Vim会智能判断此次搜索不忽略大小写
opt.hlsearch = true -- 开启搜索结果高亮 使用auto-hlsearch.nvim插件替代
opt.incsearch = true -- 输入新字符后自动刷新搜索结果
opt.tabstop = 4 -- tab符号的宽度，空格为单位，用于显示或者搭配softtabstop自动转换
opt.softtabstop = 4 -- 举例：tabstop=4，softtabstop=3，敲击tab会输入3个空格，再敲击tab又会输入3个空格，然后把6个空格转换成1个\t和2个空格；即“4进制”
opt.shiftwidth = 4 -- 自动缩进宽度，缩进使用空格，但会根据softtabstop tabstop的值自动转换
opt.expandtab = false -- 如果为true，将所有\t转换成空格，在有些要求使用tab的文件中开启会报错
opt.smartindent = true -- 开启智能缩进
opt.clipboard:append("unnamedplus") -- 剪切板
opt.fileencoding = "utf-8" -- 文件编码
opt.termguicolors = true -- 开启真彩色
opt.updatetime = 300 -- 300ms没有输入就更新磁盘上的交换文件
opt.timeoutlen = 500 -- 500ms没有按键继续输入才认为此次输入完成，过短可能会来不及使用快捷键，过长会反应较慢
opt.compatible = false -- 不兼容传统的Vi
opt.runtimepath:remove("/usr/share/vim/vimfiles") -- 将Vim的配置从Neovim的runtimepath中移除
