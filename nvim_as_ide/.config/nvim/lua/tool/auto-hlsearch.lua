local auto_hlsearch_ok, auto_hlsearch = pcall(require, "auto-hlsearch")
if not auto_hlsearch_ok then
	return
end

auto_hlsearch.setup({
	remap_keys = { "/", "?", "*", "#", "n", "N" },
	create_commands = true,
})
