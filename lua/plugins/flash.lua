return {
	"folke/flash.nvim",
	event = "VeryLazy",
	init = function()
		local function set_highlights(highlights, definition)
			for _, group in ipairs(highlights) do
				vim.api.nvim_set_hl(0, group, definition)
			end
		end

		set_highlights({ "FlashCurrent" }, { fg = "#d4be98", bg = "none", bold = true })
		set_highlights({ "FlashMatch" }, { fg = "#d8a657", bg = "none", bold = true })
		set_highlights({ "FlashLabel" }, { fg = "#282828", bg = "#ea6962", bold = true })
	end,
	opts = {},
  -- stylua: ignore
  keys = {
    -- { "<leader>o", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "<leader><leader>", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
  },
}
