return {
	"stevearc/conform.nvim",
	opts = {},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				-- c/c++
				["c"] = { "clang-format" },
				["cpp"] = { "clang-format" },
				css = { "prettier" },
				elm = { "elm_format" },
				graphql = { "prettier" },
				json = { "prettier" },
				html = { "prettier" },
				liquid = { "prettier" },
				lua = { "stylua" },
				markdown = { "prettier" },
				python = { "ruff_fix", "ruff_format" },
				rust = { "rustfmt" },
				svelte = { "prettier" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				yaml = { "prettier" },
			},
			formatters = {
				["clang-format"] = {
					prepend_args = { "--style={IndentWidth: 4}" },
				},
			},
			format_on_save = {
				lsp_fallback = true,
				timeout_ms = 500,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_format = "fallback",
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
