vim.g.mapleader = " "
vim.g.maplocalleader = " "

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

require("lazy").setup({
  ------------------------------------------------------------------------------
  defaults = {
    lazy = true,
    version = false,
  },
  ------------------------------------------------------------------------------
  checker = {
    enabled = true, -- Check for plugin updates
  },
  ------------------------------------------------------------------------------
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  ------------------------------------------------------------------------------
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
  },
  ------------------------------------------------------------------------------
  { import = "plugins" }, -- This loads all plugins from lua/plugins directory
})

require("autocmd")
require("options")
require("keymaps")

vim.cmd.colorscheme("tokyonight")
