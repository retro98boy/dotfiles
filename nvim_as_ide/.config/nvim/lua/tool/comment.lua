local comment_ok, comment = pcall(require, "Comment")
if not comment_ok then
	return
end

comment.setup({
	-- 注释符号和注释之间加空格
	padding = true,
	-- 光标停留在原位
	sticky = true,
	-- 注释/取消注释时忽略的行
	ignore = nil,
	-- 注释/取消注释前的hook
	pre_hook = nil,
	-- 注释/取消注释后的hook
	post_hook = nil,
	-- NORMAL模式下按键映射
	toggler = {
		line = "gcc",
		block = "gbc",
	},
	-- O-PENDING模式下按键映射
	opleader = {
		line = "gc",
		block = "gb",
	},
	-- 额外按键映射
	extra = {
		above = "gcO", -- 当前行上面添加注释
		below = "gco", -- 当前行下面添加注释
		eol = "gcA", -- 行尾添加注释
	},
	-- 按键绑定开关
	mappings = {
		basic = true, -- 如果为false，gcc gbc gc[count]{motion} gb[count]{motion}等按键不会工作
		extra = true, -- 如果为false，gco, gcO, gcA等按键不会工作
	},
})
