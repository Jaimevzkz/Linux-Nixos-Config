return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- Stylua formatting for Lua
				null_ls.builtins.formatting.stylua.with({
					command = "stylua", -- System-wide stylua installed via Nix
				}),

				-- Nixpkgs-fmt for Nix formatting
				null_ls.builtins.formatting.nixpkgs_fmt.with({
					command = "nixpkgs-fmt", -- Ensure nixpkgs-fmt is installed via Nix
				}),
				-- C/C++ formatting using clang-format
				null_ls.builtins.formatting.clang_format.with({
					command = "clang-format", -- Use clang-format installed via Nix
				}),

				-- Kotlin linting using ktlint
				null_ls.builtins.diagnostics.ktlint.with({
					command = "ktlint", -- Use ktlint installed via Nix
				}),
				-- Go formatting using goimports
				null_ls.builtins.formatting.goimports.with({
					command = "goimports",
				}),

				-- Go linting using golangci-lint
				null_ls.builtins.diagnostics.golangci_lint.with({
					command = "golangci-lint",
				}),
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
