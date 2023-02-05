local colorizer_ok, colorizer = pcall(require, "colorizer")
if not colorizer_ok then
	return
end

colorizer.setup({
	filetypes = {
		"*",
		-- "css",
		-- "javascript",
		-- css = { rgb_fn = false },
		-- html = { names = false, mode = "background" },
	},
	user_default_options = {
		RGB = true, -- #c3d
		RRGGBB = true, -- #ff7b72
		names = true, -- Blue blue
		RRGGBBAA = true, -- #ff7b7acc
		AARRGGBB = true, -- 0xccff7b7a
		rgb_fn = true, -- CSS的rgb() rgba()函数 rbg(255,0,0)
		hsl_fn = true, -- CSS的hsl() hsla()函数
		css = true, -- 在CSS文件中渲染所有色值：rgb_fn, hsl_fn, names, RGB, RRGGBB
		css_fn = true, -- 在CSS文件中渲染所有颜色函数：rgb_fn, hsl_fn
		mode = "background", -- 显示模式：foreground, background, virtualtext
		tailwind = true, -- 渲染tailwind颜色：false, true/"normal", "lsp", "both"
		virtualtext = "■",
	},
})
