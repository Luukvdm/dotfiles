local nls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

nls.setup({
  sources = {
    nls.builtins.formatting.stylua.with({ extra_args = { "--indent-type", "Spaces", "--indent-width", "2" } }),
    nls.builtins.code_actions.gitsigns,
    -- nls.builtins.code_actions.refactoring,

    -- nls.builtins.diagnostics.eslint_d,
    -- nls.builtins.formatting.prettier.with({
    --   extra_args = { "--single-quote", "false" },
    -- }),
    nls.builtins.formatting.terraform_fmt,
    nls.builtins.formatting.black,
    nls.builtins.formatting.goimports,
    nls.builtins.formatting.goimports_reviser,
    -- nls.builtins.formatting.gofumpt,
    -- nls.builtins.formatting.latexindent.with({
    --   extra_args = { "-g", "/dev/null" }, -- https://github.com/cmhughes/latexindent.pl/releases/tag/V3.9.3
    -- }),
    nls.builtins.code_actions.shellcheck,
    -- nls.builtins.diagnostics.vale.with({ extra_args = { "--config", "~/.config/vale/vale.ini" } }),
    nls.builtins.code_actions.gitsigns,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          if AUTOFORMAT_ACTIVE then -- global var defined in functions.lua
            vim.lsp.buf.format({ bufnr = bufnr })
          end
        end,
      })
    end
  end,
})
