local wezterm = require("wezterm")
local act = wezterm.action
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

local is_linux = function()
	return wezterm.target_triple:find("linux") ~= nil
end

local is_windows = function()
	return wezterm.target_triple:find("windows") ~= nil
end

local default_shell = function()
	if is_linux() then
		return { "zsh" }
	elseif is_windows() then
		return { "zsh" }
		-- return { "pwsh" }
	end
end

-- https://wezfurlong.org/wezterm/config/lua/window-events/format-tab-title.html
local function tab_title(tab_info)
	local title = tab_info.tab_title
	-- if the tab title is explicitly set, take that
	if title and #title > 0 then
		return title
	end
	-- Otherwise, use the title from the active pane
	-- in that tab
	return tab_info.active_pane.title
end

-- 标签栏
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local edge_background = "#0b0022"
	local background = "#1b1032"
	local foreground = "#808080"

	if tab.is_active then
		background = "#2b2042"
		foreground = "#c0c0c0"
	elseif hover then
		background = "#3b3052"
		foreground = "#909090"
	end

	local edge_foreground = background

	local title = tab_title(tab)

	-- ensure that the titles fit in the available space,
	-- and that we have room for the edges.
	title = wezterm.truncate_right(title, max_width - 2)

	return {
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_LEFT_ARROW },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_RIGHT_ARROW },
	}
end)

local config = {
	check_for_updates = false,
	automatically_reload_config = true,
	default_prog = default_shell(),

	-- 标签栏
	tab_bar_at_bottom = true,
	hide_tab_bar_if_only_one_tab = true,
	tab_max_width = 32,
	use_fancy_tab_bar = false,

	-- 窗口
	window_padding = {
		left = "0.0cell",
		right = "0.0cell",
		top = "0.0cell",
		bottom = "0.0cell",
	},
	window_background_opacity = 1.0,

	-- 光标
	default_cursor_style = "BlinkingBar",

	-- 字体
	font = wezterm.font_with_fallback({
		{
			family = "FiraCode Nerd Font Mono",
			weight = "Regular",
			italic = false,
			-- https://wezfurlong.org/wezterm/config/font-shaping.html#advanced-font-shaping-options
			harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
		},
		"Noto Sans CJK SC",
	}),
	font_size = 11.2,

	-- 配色
	color_scheme = "Cobalt2",

	-- 按键绑定
	-- 执行 wezterm show-keys --lua 可查看已经绑定的按键
	keys = {
		{ key = "T", mods = "CTRL|SHIFT", action = act.SpawnTab("CurrentPaneDomain") },

		{ key = "<", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(-1) },
		{ key = ">", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(1) },

		{ key = "<", mods = "CTRL|SHIFT|ALT", action = act.MoveTabRelative(-1) },
		{ key = ">", mods = "CTRL|SHIFT|ALT", action = act.MoveTabRelative(1) },

		{ key = "?", mods = "CTRL|SHIFT", action = act.CloseCurrentTab({ confirm = true }) },

		{ key = "|", mods = "CTRL|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "_", mods = "CTRL|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },

		{ key = "K", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Up") },
		{ key = "J", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Down") },
		{ key = "H", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Left") },
		{ key = "L", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Right") },

		{ key = "LeftArrow", mods = "CTRL|SHIFT", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "RightArrow", mods = "CTRL|SHIFT", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "UpArrow", mods = "CTRL|SHIFT", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "DownArrow", mods = "CTRL|SHIFT", action = act.AdjustPaneSize({ "Down", 1 }) },

		{ key = "Q", mods = "CTRL|SHIFT", action = act.QuitApplication },
		{ key = "W", mods = "CTRL|SHIFT", action = act.CloseCurrentPane({ confirm = true }) },

		{ key = "}", mods = "CTRL|SHIFT", action = act.RotatePanes("Clockwise") },
		{
			key = "{",
			mods = "CTRL|SHIFT",
			action = act.RotatePanes("CounterClockwise"),
		},

		-- https://ansidev.xyz/posts/2023-05-18-wezterm-cheatsheet
		{
			key = "R",
			mods = "CTRL|SHIFT",
			action = act.PromptInputLine({
				description = "Enter new name for tab",
				action = wezterm.action_callback(function(window, _, line)
					-- line will be `nil` if they hit escape without entering anything
					-- An empty string if they just hit enter
					-- Or the actual line of text they wrote
					if line then
						window:active_tab():set_title(line)
					end
				end),
			}),
		},
	},

	-- 鼠标绑定
	mouse_bindings = {
		-- 选中文本->右键单击复制    未选中文本->右键单击粘贴
		-- https://github.com/wez/wezterm/discussions/3541#discussioncomment-5633570
		{
			event = { Down = { streak = 1, button = "Right" } },
			mods = "NONE",
			action = wezterm.action_callback(function(window, pane)
				local has_selection = window:get_selection_text_for_pane(pane) ~= ""
				if has_selection then
					window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
					window:perform_action(act.ClearSelection, pane)
				else
					window:perform_action(act({ PasteFrom = "Clipboard" }), pane)
				end
			end),
		},

		-- 左键单击URL跳转
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = act.OpenLinkAtMouseCursor,
		},
	},
}

return config
