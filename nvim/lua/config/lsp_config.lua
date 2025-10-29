require("mason").setup()

local ensure_installed = {
  "lua_ls",
  "ts_ls",
  "html",
  "cssls",
  "eslint",
  "jedi_language_server"
}

require("mason-lspconfig").setup({
  ensure_installed = ensure_installed
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")

for _, lang in ipairs(ensure_installed) do
  local config = { capabilities }

  if lang == "eslint" then
    config.bin = "eslint"
    config.code_actions = {
      enable = true,
      diagnostics = {
	enable = true,
	run_on = "type"
      }
    }
  end

  lspconfig[lang].setup(config)
end

