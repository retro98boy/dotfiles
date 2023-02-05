local todo_comments_ok, todo_comments = pcall(require, "todo-comments")
if not todo_comments_ok then
	return
end

todo_comments.setup({
	signs = true, -- 左侧栏图标显示
	sign_priority = 8, -- 图标优先级
	keywords = {
		FIX = {
			icon = " ",
			color = "#DC2626",
			alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
			-- signs = false, -- 单独设置选项
		},
		TODO = { icon = " ", color = "#2563EB" },
		HACK = { icon = " ", color = "#7C3AED" },
		WARN = { icon = " ", color = "#FBBF24", alt = { "WARNING", "XXX" } },
		PERF = { icon = " ", color = "#FC9868", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
		NOTE = { icon = " ", color = "#10B981", alt = { "INFO" } },
		TEST = { icon = "⏲ ", color = "#FF00FF", alt = { "TESTING", "PASSED", "FAILED" } },
	},
})
