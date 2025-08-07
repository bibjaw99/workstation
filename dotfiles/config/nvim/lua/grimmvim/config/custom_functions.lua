-- toggle conceallevel
function ToggleConcealLevel()
	if vim.wo.conceallevel == 0 then
		vim.wo.conceallevel = 2
	else
		vim.wo.conceallevel = 0
	end
end

-- automatically create a file if it does not exist
function OpenFile()
	local filepath = vim.fn.expand("<cfile>")
	if vim.fn.filereadable(filepath) == 0 then
		-- Create and open the file
		vim.cmd("edit " .. filepath)
		print("Created new file: " .. filepath)
	else
		-- Open the existing file
		vim.cmd("edit " .. filepath)
	end
end

-- lsp floating window modifications
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or "bold"
	opts.max_width = opts.max_width or 80
	opts.max_height = opts.max_height or 20
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
