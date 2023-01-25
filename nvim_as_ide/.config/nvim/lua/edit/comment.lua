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
})

-- 按键映射
require("keymaps").comment_map(comment)
