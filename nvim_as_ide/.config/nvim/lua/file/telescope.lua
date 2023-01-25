local telescope_ok, telescope = pcall(require, "telescope")
if not telescope_ok then
	return
end

telescope.setup({
	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },
		file_ignore_patterns = { ".git/", "node_modules" },
	},
})
