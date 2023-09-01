-- requring plugin
local installed, Null_ls = pcall(require, "null-ls")
if not installed then
	vim.notify("Plugin 'null-ls' is not installed")
	return
end

-- Setting up Null_ls
local formatting = Null_ls.builtins.formatting
local sources = {
	formatting.stylua,
	formatting.prettier,
	formatting.autopep8,
	formatting.black,
	formatting.isort,
	formatting.eslint,
}

Null_ls.setup({
	sources = sources,
})
