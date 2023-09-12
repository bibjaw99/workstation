--  Calling  necessary plugins
--  dap
local installed, Dap = pcall(require, "dap")
if not installed then
	vim.notify("Plugin 'nvim-dap' is not installed")
	return
end

-- dapui
local installed, Dapui = pcall(require, "dapui")
if not installed then
	vim.notify("Plugin 'nvim-dap-ui'is not installed")
	return
end
Dapui.setup()

-- dap-vscode-js
local installed, DapVscodeJs = pcall(require, "dap-vscode-js")
if not installed then
	vim.notify("Plugin 'dap-vscode-js' is not installed")
	return
end

-- #############################################################################

-- Autometic restarting dapui
Dap.listeners.after.event_initialized["dapui_config"] = function()
	Dapui.open({})
end
Dap.listeners.before.event_terminated["dapui_config"] = function()
	Dapui.close({})
end
Dap.listeners.before.event_exited["dapui_config"] = function()
	Dapui.close({})
end

-- keymap for dapui
vim.keymap.set("n", "<leader>ui", require("dapui").toggle)

-- #############################################################################

-- configure nvim-dap-vscode-js
DapVscodeJs.setup({
	debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
	adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
})

-- #############################################################################

-- Configuring the DAP Adapter
local js_based_languages = { "typescript", "javascript", "typescriptreact" }
for _, language in ipairs(js_based_languages) do
	Dap.configurations[language] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-node",
			request = "attach",
			name = "Attach",
			processId = require("dap.utils").pick_process,
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-chrome",
			request = "launch",
			name = 'Start Chrome with "localhost"',
			url = "http://localhost:3000",
			webRoot = "${workspaceFolder}",
			userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
		},
	}
end
