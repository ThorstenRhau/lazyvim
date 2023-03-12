-- Setting mapleader (:h mapleader)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Disabling netrw (built in file browser)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
-----------------------------------------------------------------------------
require("lazy").setup({
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    opts = function()
      require("nvim-treesitter.configs").setup({
        -- A list of parser names, or "all"
        -- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
        ensure_installed = {
          "lua",
          "markdown",
          "markdown_inline",
          "vim",
        },
        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
        },
      })
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      disable_filetype = { "TelescopePrompt", "vim" },
    },
  },
  {
    "abecodes/tabout.nvim",
    event = "InsertEnter",
    dependencies = {
      "nvim-treesitter",
    },
    opts = {},
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    opts = {
      undercurl = true,
      underline = true,
      bold = true,
      italic = true,
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true,    -- invert background for search, diffs, statuslines and errors
      contrast = "soft", -- can be "hard", "soft" or empty string
      palette_overrides = {},
      overrides = {},
      dim_inactive = true,
      transparent_mode = false,
    },
  },
  -----------------------------------------------------------------------------
  { import = "plugins" }, -- This loads all plugins from lua/plugins directory
})

-----------------------------------------------------------------------------
require("autocmd")
require("options")
require("keymaps")

vim.cmd.colorscheme("gruvbox")
