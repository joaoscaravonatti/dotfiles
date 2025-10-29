require("telescope").setup({
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "dist",
      "coverage"
    },
    pickers = {
      find_files = {
	find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" }
      }
    }
  }
})
