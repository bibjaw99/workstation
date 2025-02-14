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
