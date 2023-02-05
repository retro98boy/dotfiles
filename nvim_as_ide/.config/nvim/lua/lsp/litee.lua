local litee_lib_ok, litee_lib = pcall(require, "litee.lib")
if not litee_lib_ok then
	return
end

litee_lib.setup({
	tree = {
		icon_set = "codicons",
	},
	panel = {
		orientation = "right",
		panel_size = 30,
	},
})