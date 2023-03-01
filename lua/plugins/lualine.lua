return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      extensions = { "neo-tree", "quickfix", "fugitive", "symbols-outline" },
    },
  },
}
