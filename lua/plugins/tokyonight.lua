return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "moon",
      light_style = "day",
      transparent = false,
      terminal_colors = true,
      styles = {
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "dark",
        floats = "dark",
      },
      sidebars = { "qf", "help" },
      day_brightness = 0.3, -- **Day** style. Number between 0 and 1, from dull to vibrant colors
      hide_inactive_statusline = false,
      dim_inactive = true,
      lualine_bold = false,
      ---@diagnostic disable-next-line: unused-local
      on_colors = function(colors) end,
      ---@diagnostic disable-next-line: unused-local
      on_highlights = function(highlights, colors) end,
    },
  },
}
