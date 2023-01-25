local inc_rename_ok, inc_rename = pcall(require, "inc_rename")
if not inc_rename_ok then
	return
end

inc_rename.setup({})
