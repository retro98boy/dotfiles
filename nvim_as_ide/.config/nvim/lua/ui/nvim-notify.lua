local notify_ok, notify = pcall(require, "notify")
if not notify_ok then
	return
end

notify.setup({
	background_colour = "Normal",
	fps = 30,
	icons = {
		DEBUG = "",
		ERROR = "",
		INFO = "",
		TRACE = "✎",
		WARN = "",
	},
	level = 2,
	minimum_width = 50,
	render = "default",
	stages = "fade",
	timeout = 3000,
	top_down = true,
})

vim.notify = notify -- 替代自带的通知API
