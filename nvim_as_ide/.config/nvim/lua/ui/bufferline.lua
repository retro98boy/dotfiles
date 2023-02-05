local bufferline_ok, bufferline = pcall(require, "bufferline")
if not bufferline_ok then
	return
end

bufferline.setup({
	options = {
		mode = "buffers", -- or "tabs"
		-- Bdelete命令依赖famiu/bufdelete.nvim插件
		close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
		right_mouse_command = "Bdelete! %d",
		left_mouse_command = "buffer %d",
		middle_mouse_command = nil,
		indicator = { style = "icon", icon = "▎" }, -- 位置指示符号
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		color_icons = true,
		separator_style = "thin", -- 顶部标签栏风格
		diagnostics = "nvim_lsp", -- 对接nvim_lsp，显示LSP诊断状态，设置成false关闭该功能
		diagnostics_update_in_insert = false,
		-- 给nvim-tree让出位置
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "left",
				separator = true,
			},
		},
	},
})
