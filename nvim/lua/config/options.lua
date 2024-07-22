local opt = vim.opt

opt.autowrite = false
opt.confirm = true -- 退出时有未保存的缓冲区会确认是否保存
-- backup writebackup  action
-- off       off        no backup made
-- off       on         backup current file, deleted afterwards (default)
-- on        off        delete old backup, backup current file
-- on        on         delete old backup, backup current file
opt.writebackup = false
opt.backup = false
opt.swapfile = false -- 不创建交换文件
opt.undofile = true -- 生成持久化的undofile
opt.undolevels = 10000
opt.autoread = true -- 文件被其他软件修改后，Vim会自动重新加载
opt.number = true -- 开启行号
opt.relativenumber = true -- 开启相对行号
opt.numberwidth = 2 -- 行号显示列的宽度
opt.wrap = true -- 开启自动换行
opt.linebreak = true -- 和wrap搭配使用，自动换行时不拆词
opt.cmdheight = 0 -- 下方cmd界面高度
opt.signcolumn = "yes" -- 总是显示左侧符号列，一些插件使用到，例如断点调试符号
opt.showmode = false -- 禁用内置的底部模式显示，类似-- INSERT --
opt.splitbelow = true -- 垂直分割时，新窗口从上面出现
opt.splitright = true -- 水平分割时，新窗口从右边出现
opt.cursorline = true -- 高亮当前行
-- opt.cursorcolumn = true -- 高亮当前列
opt.scrolloff = 8 -- 光标上下移动时，上边和下边保留的行数，继续移动光标开始滚屏
opt.sidescrolloff = 8 -- 光标左右移动时，左边和右边保留的行数，继续移动光标开始滚屏
-- opt.whichwrap = "<,>,[,],h,l" -- 光标在行首/行尾时哪些横向移动的按键可以跳到上/下一行
opt.mouse = "a" -- 任何模式下启用鼠标
opt.ignorecase = true -- 搜索时忽略大小写
opt.smartcase = true -- 智能判断是否在搜索时忽略大小写，在ignorecase为true时有效。忽略大小写后，几乎都使用全小写搜索，这时搜索输入中有大写，Vim会智能判断此次搜索不忽略大小写
-- opt.hlsearch = true -- 开启搜索结果高亮
opt.incsearch = true -- 输入新字符后自动刷新搜索结果
opt.tabstop = 2 -- Tab符号显示的宽度，单位为空格，不影响Tab键的行为
opt.softtabstop = 2 -- 将空格转换成\t的进制。例如expandtab=false且softtabstop=2，按下5个或6个空格再按Tab，会转换成3个\t
opt.expandtab = false -- 如果为true，将所有\t转换成空格
opt.shiftwidth = 2 -- 缩进宽度，单位为空格，由expandtab决定缩进使用空格还是\t
opt.smartindent = true -- 开启智能缩进
opt.clipboard = "unnamedplus" -- 同步系统剪切板
opt.fileencodings = "utf-8, gb18030, gbk, gb2312, cp936, big5, euc-jp, euc-kr, latin1" -- 打开文件时尝试使用的编码
opt.fileencoding = "utf-8" -- 优先utf-8编码
opt.termguicolors = true -- 开启真彩色
opt.updatetime = 300 -- 300ms没有输入就更新磁盘上的交换文件
opt.timeoutlen = 300 -- 300ms没有按键继续输入便认为此次输入完成
opt.list = true -- 显示不可见字符如空格换行等
opt.listchars:append("tab:>~")
opt.listchars:append("space:⋅")
opt.listchars:append("eol:↴")
opt.foldmethod = "expr" -- 基于nvim-treesitter折叠文本
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false -- 默认不要折叠
opt.foldlevel = 99
opt.completeopt = "menu,menuone,noselect"

vim.g.autoformat = false -- 禁止保存时自动格式化
