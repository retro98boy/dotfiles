local symbols_outline_ok, symbols_outline = pcall(require, "symbols-outline")
if not symbols_outline_ok then
	return
end

symbols_outline.setup({})
