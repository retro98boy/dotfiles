-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sumneko_lua

local opts = {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT", -- 告诉服务器使用的Lua版本
			},
			diagnostics = {
				globals = { "vim" }, -- 让服务器认识vim全局变量
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true), -- 让服务器知道Neovim的运行时文件
				checkThirdParty = false,
			},
			telemetry = {
				enable = false,
			},
		},
	},

	flags = {
		debounce_text_changes = 150, -- 文本输入去抖动，即停止输入一段时间后服务器再做反应，减小压力
	},

	on_attach = function(client, bufnr)
		local function buf_keymap(...)
			vim.api.nvim_buf_set_keymap(bufnr, ...)
		end

		require("keymaps").lsp_map(buf_keymap) -- 调用回调函数在当前buffer中映射按键
	end,
}

return {
	setup = function(server)
		server.setup(opts)
	end,
}
