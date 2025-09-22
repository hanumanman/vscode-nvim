local vscode = require("vscode")
local map = vim.keymap.set

map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
map("n", "vie", "ggVG", { desc = "Select all" })
map("n", "cie", "ggcG", { desc = "Change all" })
map("n", "die", "ggdG", { desc = "Delete all" })
map("n", "yie", "ggyG", { desc = "Yank all" })

-- VSCode API mappings
-- Utils
map("n", "<leader>f", function()
	vscode.action("workbench.action.files.save")
end, { desc = "Save file" })

map("n", "<leader>s", function()
	vscode.action("workbench.action.quickOpen")
end, { desc = "Search files" })

map({ "n", "v" }, "<leader>a", function()
	vscode.action("workbench.action.showCommands")
end, { desc = "Show commands palette" })

map("n", "<leader>z", function()
	vscode.action("workbench.action.toggleZenMode")
end, { desc = "Toggle Zen Mode" })

map({ "v", "n" }, "<leader>ii", function()
	vscode.action("inlineChat.start")
end, { desc = "Start Inline Chat" })

map({ "v", "n" }, "<leader>ij", function()
	vscode.action("workbench.panel.chat.view.copilot.focus")
end, { desc = "Focus Copilot Chat" })

-- Git
map({ "v", "n" }, "<leader>hr", function()
	vscode.action("git.revertSelectedRanges", {
		callback = function(err)
			if err == nil then
				vim.schedule(function()
					-- Center the screen after
					vim.api.nvim_input("zz")
				end)
			end
		end,
	})
end, { desc = "Revert selected changes" })

map("n", "<leader>g", function()
	vscode.action("lazygit-vscode.toggle")
end, { desc = "Git: Open Lazygit" })

map("n", "<leader>hg", function()
	vscode.action("workbench.view.scm")
end, { desc = "Open git explorer" })

map("v", "<leader>hs", function()
	vscode.action("git.stageSelectedRanges")
end, { desc = "Git: Stage selected changes" })

map("n", "<leader>hc", function()
	vscode.action("git.commit")
end, { desc = "Git: Commit" })

map("n", "<leader>hl", function()
	vscode.action("git.commitAll")
end, { desc = "Git: Stage all changes and commit" })

map("n", "<leader>ha", function()
	vscode.action("git.stageAll")
end, { desc = "Git: Stage all changes" })

map("n", "<leader>hp", function()
	vscode.action("git.pull")
end, { desc = "Git: Pull" })

map("n", "<leader>hP", function()
	vscode.action("git.push")
end, { desc = "Git: Push" })

map("n", "]c", function()
	vscode.action("workbench.action.editor.nextChange")
	vscode.action("workbench.action.compareEditor.nextChange")
end, { desc = "Git: Go to next change" })

map("n", "[c", function()
	vscode.action("workbench.action.editor.previousChange")
end, { desc = "Git: Go to previous change" })

-- Lsp
map("n", "gd", function()
	vscode.action("editor.action.revealDefinition")
end, { desc = "Go to definition" })

map("n", "gr", function()
	vscode.action("editor.action.goToReferences")
end, { desc = "Go to references" })

map("n", "gt", function()
	vscode.action("editor.action.peekTypeDefinition")
end, { desc = "Peek type definition" })

map({ "n", "v" }, "<leader>ca", function()
	vscode.action("editor.action.quickFix")
end, { desc = "Show code actions" })

map("n", "<leader>rn", function()
	vscode.action("editor.action.rename")
end, { desc = "LSP Rename" })

map("n", "]d", function()
	vscode.action("editor.action.marker.next")
end, { desc = "Go to next diagnostic" })

map("n", "[d", function()
	vscode.action("editor.action.marker.prev")
end, { desc = "Go to previous diagnostic" })

map("n", "<leader>ds", function()
	vscode.action("workbench.action.gotoSymbol")
end, { desc = "Search LSP symbols" })

map("n", "<leader>dw", function()
	vscode.action("search.action.openNewEditor")
end, { desc = "Grep in workspace" })

-- File explorer
map("n", "<leader>e", function()
	vscode.action("workbench.view.explorer")
end, { desc = "Open file explorer" })

-- Terminal
map("n", "<C-j>", function()
	vscode.action("workbench.action.terminal.toggleTerminal")
end, { desc = "Toggle terminal" })

-- Tab controls
map("n", "L", function()
	vscode.action("workbench.action.nextEditorInGroup")
end, { desc = "Next tab" })

map("n", "H", function()
	vscode.action("workbench.action.previousEditorInGroup")
end, { desc = "Previous tab" })

map("n", "<leader>db", function()
	vscode.action("workbench.action.showAllEditors")
end, { desc = "List open buffers" })

map("n", "<leader>bc", function()
	vscode.action("workbench.action.closeOtherEditors")
end, { desc = "Close other buffers" })

map("n", "<leader>x", function()
	vscode.action("workbench.action.closeActiveEditor")
end, { desc = "Close current buffer" })
