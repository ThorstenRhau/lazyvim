return {
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      char = "│",
      filetype_exclude = { "help", "alpha", "dashboard", "nvim-tree", "Trouble", "lazy" },
      show_current_context = false,
      show_current_context_start = false,
    },
  },
}
