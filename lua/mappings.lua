local vscode = require("vscode")
local map = vim.keymap.set

map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
map("n", "vie", "ggVG", { desc = "Select all" })
map("n", "cie", "ggcG", { desc = "Change all" })
map("n", "die", "ggdG", { desc = "Change all" })

-- VSCode API mappings
-- Utils
map("n", "<leader>f", function()
	vscode.action("workbench.action.files.save")
end)

map("n", "<leader>s", function()
	vscode.action("workbench.action.quickOpen")
end)

map({ "n", "v" }, "<leader>a", function()
	vscode.action("workbench.action.showCommands")
end)

map("n", "<leader>z", function()
	vscode.action("workbench.action.toggleZenMode")
end)

map({ "v", "n" }, "<leader>ii", function()
	vscode.action("inlineChat.start")
end)

-- Git
map({ "v", "n" }, "<leader>hr", function()
	vscode.action("git.revertSelectedRanges", {
		callback = function(err)
			if err == nil then
				-- Center the screen after the VSCode action completes
				vim.schedule(function()
					vim.api.nvim_input("zz")
				end)
			end
		end,
	})
end)

-- Lsp
map("n", "gd", function()
	vscode.action("editor.action.revealDefinition")
end)

map("n", "gr", function()
	vscode.action("editor.action.goToReferences")
end)

map("n", "gt", function()
	vscode.action("editor.action.peekTypeDefinition")
end)

map("n", "<leader>ca", function()
	vscode.action("editor.action.quickFix")
end)

map("n", "<leader>rn", function()
	vscode.action("editor.action.rename")
end)

map("n", "]d", function()
	vscode.action("editor.action.marker.next")
end)

map("n", "[d", function()
	vscode.action("editor.action.marker.prev")
end)

map("n", "<leader>ds", function()
	vscode.action("workbench.action.gotoSymbol")
end)

map("n", "<leader>dw", function()
	vscode.action("search.action.openNewEditor")
end)

-- File explorer
map("n", ",", function()
	vscode.action("workbench.view.explorer")
end)

-- Terminal
map("n", "<C-j>", function()
	vscode.action("workbench.action.terminal.toggleTerminal")
end)

-- Tab controls
map("n", "L", function()
	vscode.action("workbench.action.nextEditorInGroup")
end)

map("n", "H", function()
	vscode.action("workbench.action.previousEditorInGroup")
end)

map("n", "<leader>db", function()
	vscode.action("workbench.action.showAllEditors")
end)

map("n", "<leader>bc", function()
	vscode.action("workbench.action.closeOtherEditors")
end)

map("n", "<leader>x", function()
	vscode.action("workbench.action.closeActiveEditor")
end)
