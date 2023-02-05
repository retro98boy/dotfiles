local litee_calltree_ok, litee_calltree = pcall(require, "litee.calltree") -- 一定要放在litee_lib.setup后面，否则calltree不生效
if not litee_calltree_ok then
	return
end

litee_calltree.setup({
	hide_cursor = true,
	no_hls = true,
	on_open = "panel", -- "panel" or "popout"
	disable_keymaps = false,
	keymaps = {
		expand = "o",
		collapse = "zc",
		collapse_all = "zM",
		jump = "<CR>",
		jump_split = "s",
		jump_vsplit = "v",
		jump_tab = "t",
		hover = "i",
		details = "d",
		close = "X",
		close_panel_pop_out = "<C-c>",
		help = "?",
		hide = "H",
		switch = "S",
		focus = "f",
	},
})
