-- Highlight when yanking (copying) text
local textYankPostGroup = vim.api.nvim_create_augroup("yankTextGroup", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = textYankPostGroup,
	callback = function()
		vim.highlight.on_yank({ timeout = 50 })
	end,
})
