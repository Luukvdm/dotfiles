local cmp = require("cmp")
local nvim_lsp = require("lspconfig")
local utils = require("config.lsp.utils")

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "vsnip" },
    { name = "path" },
  }, {
    { name = "buffer" },
  }),
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources({
    { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = "buffer" },
  }),
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})

-- Setup lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)
  require("lsp-format").on_attach(client)

  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
  local ft = vim.bo[bufnr].filetype
  if client.server_capabilities.document_formatting then
    client.server_capabilities.documentFormattingProvider = true
    client.server_capabilities.documentRangeFormattingProvider = true
    vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")
  end
end

-- python and bash setup
local servers = {
  "pylsp",
  "bashls",
  "marksman",
}

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

-- go setup
nvim_lsp["gopls"].setup({
  md = { "gopls" },
  on_attach = on_attach,
  capabilities = capabilities,
  settings = require("config.lsp.langs.go"),
  init_options = {
    usePlaceholders = true,
  },
})

-- lua setup
nvim_lsp.lua_ls.setup({
  on_attach = on_attach,
  settings = require("config.lsp.langs.lua"),
})

-- csharp setup
nvim_lsp.omnisharp.setup({
  cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
  on_attach = on_attach,
  enable_editorconfig_support = true,
  enable_roslyn_analyzers = false,
  organize_imports_on_format = true,
  enable_import_completion = true,
})

-- yaml setup
nvim_lsp.yamlls.setup({
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)

    if vim.bo[bufnr].buftype ~= "" or vim.bo[bufnr].filetype == "helm" then
      utils.notify("Disabling yaml diagnostics", "info", "lsp.lua")
      vim.diagnostic.disable()
    end
  end,
  settings = require("config.lsp.langs.yaml"),
})

nvim_lsp.volar.setup({
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
})

local nls = require("null-ls")
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
    nls.builtins.formatting.gofumpt,
    -- nls.builtins.formatting.latexindent.with({
    --   extra_args = { "-g", "/dev/null" }, -- https://github.com/cmhughes/latexindent.pl/releases/tag/V3.9.3
    -- }),
    nls.builtins.code_actions.shellcheck,
    nls.builtins.diagnostics.vale,
    nls.builtins.code_actions.gitsigns,
  },
  on_attach = on_attach,
})
