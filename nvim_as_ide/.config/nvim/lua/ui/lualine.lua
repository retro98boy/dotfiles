local lualine_ok, lualine = pcall(require, "lualine")
if not lualine_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
	cond = hide_in_width,
}

local filetype = {
	"filetype",
	icons_enabled = false,
}

local location = {
	"location",
	padding = 0,
}

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
	options = {
		theme = "auto",
		ignore_focus = {},
		always_divide_middle = true, -- 永远对称，即使段x y z不存在，段a b c也不能接管整个状态栏
		globalstatus = true, -- 只有一个全局的lualine，而不是每个窗口都有一个，需要Neovim 0.7版本及以上
		-- https://github.com/ryanoasis/powerline-extra-symbols
		-- echo "\uE0B4" "\uE0B6" "\uE0B5" "\uE0B7"
		section_separators = { -- 段之间的分隔符
			left = "",
			right = "",
		},
		component_separators = { -- 段中不同组件的分隔符
			left = "",
			right = "",
		},
		disabled_filetypes = { -- 在一些文件中关闭lualine
			statusline = {},
			winbar = {},
		},
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = { diagnostics },
		lualine_x = { diff, spaces, "encoding", filetype },
		lualine_y = { location },
		lualine_z = { "progress" },
	},
	extensions = { "nvim-tree" }, -- 给nvim-tree让出位置
})
