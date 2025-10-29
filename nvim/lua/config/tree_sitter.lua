local configs = require("nvim-treesitter.configs")

configs.setup({
  ensure_installed = {
    "lua",
    "typescript",
    "tsx",
    "html",
    "css",
    "python"
  },
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = true }
})
