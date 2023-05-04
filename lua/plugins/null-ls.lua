require("mason-null-ls").setup({
	ensure_installed = {
		-- Opt to list sources here, when available in mason.
	},
	automatic_installation = false,
	automatic_setup = true, -- Recommended, but optional
	handlers = {},
})

--[[ require("null-ls").setup({
  sources = {
    require("null-ls").builtins.diagnostics.codespell.with({
      filetypes = { "markdown", "text" },
    }),
    require("typescript.extensions.null-ls.code-actions"),
  },
}) ]]
local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local sources = {
	formatting.eslint,
	formatting.black,
	formatting.stylua,
}

null_ls.setup({
	sources = sources,

})
