local indent_blankline_ok, indent_blankline = pcall(require, "indent_blankline")
if not indent_blankline_ok then
	return
end

indent_blankline.setup({
	-- show_end_of_line = true,
	-- space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
	context_patterns = {
		"class",
		"^func",
		"method",
		"^if",
		"while",
		"for",
		"with",
		"try",
		"except",
		"arguments",
		"argument_list",
		"object",
		"dictionary",
		"element",
		"table",
		"tuple",
		"do_block",
	},
})
