require("nvim-tree").setup({
  actions = {
    open_file = {
      quit_on_open = true
    }
  },
  diagnostics = {
    enable = true
  },
  view = {
    side = "left"
  },
  git = {
    enable = true,
    ignore = false
  }
})
