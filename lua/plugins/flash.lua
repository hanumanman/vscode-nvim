return {
	"folke/flash.nvim",
	event = "VeryLazy",
	init = function()
		local function set_highlights(highlights, definition)
			for _, group in ipairs(highlights) do
				vim.api.nvim_set_hl(0, group, definition)
			end
		end

		set_highlights({ "FlashCurrent" }, { fg = "#D4D4D4", bg = "#569CD6", bold = true })
		set_highlights({ "FlashMatch" }, { fg = "#4EC9B0", bg = "#1E1E1E", bold = true })
		set_highlights({ "FlashLabel" }, { fg = "#D4D4D4", bg = "#007ACC", bold = true })
	end,
	opts = {},
  -- stylua: ignore
  keys = {
    { "<leader>o", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "<leader><leader>", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
  },
}
