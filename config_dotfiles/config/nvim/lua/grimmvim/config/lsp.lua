local lsp_servers = {
	"bashls",
	"clangd",
	"lua_ls",
	"html",
	"cssls",
	"emmet_ls",
	"marksman",
	"ts_ls",
	"eslint",
	"biome",
	"tailwindcss",
	"jsonls",
	"pyright",
}

for _, server in ipairs(lsp_servers) do
	vim.lsp.enable(server)
end
