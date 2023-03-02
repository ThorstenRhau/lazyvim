return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    cmd = "NvimTreeToggle",
    lazy = true,
    opts = {
      sort_by = "case_sensitive",
      view = {
        width = 24,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
      },
    },
  },
}
