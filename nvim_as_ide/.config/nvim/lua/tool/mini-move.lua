local mini_move_ok, mini_move = pcall(require, "mini.move")
if not mini_move_ok then
	return
end

mini_move.setup({
	mappings = {
		-- 可是模式移动所选内容
		left = "<A-h>",
		right = "<A-l>",
		down = "<A-j>",
		up = "<A-k>",

		-- 普通模式直接移动当前光标所在行
		line_left = "<A-h>",
		line_right = "<A-l>",
		line_down = "<A-j>",
		line_up = "<A-k>",
	},
	options = {
		reindent_linewise = true, -- 纵向移动时自动重新缩进
	},
})
