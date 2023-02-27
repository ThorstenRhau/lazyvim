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
  {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  {
    'folke/which-key.nvim',
    opts = {},
    event = 'BufReadPost',
  },
  {
    'nvim-tree/nvim-web-devicons',
  },
  {
    'nvim-treesitter/nvim-treesitter',
  },
  {
    'lewis6991/gitsigns.nvim',
  },
  {
    'tpope/vim-fugitive',
  },
  {
    'hrsh7th/nvim-cmp',
  },
  {
    'hrsh7th/cmp-nvim-lsp',
  },
  {
    'hrsh7th/cmp-buffer',
  },
  {
    'hrsh7th/cmp-path',
  },
  {
    'L3MON4D3/LuaSnip',
  },
  {
    'saadparwaiz1/cmp_luasnip',
  },
  {
    'rafamadriz/friendly-snippets',
  },
  {
    'goolord/alpha-nvim',
  },
  {
    'windwp/nvim-autopairs',
  },
  {
    'anuvyklack/pretty-fold.nvim',
  },
  {
    'abecodes/tabout.nvim',
  },
  {
    'echasnovski/mini.indentscope',
  },
  {
    'lukas-reineke/indent-blankline.nvim',
  },
  {
    'crispgm/nvim-tabline',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    opts = {},
  },
  {
    'williamboman/mason.nvim',
  },
  {
    'williamboman/mason-lspconfig.nvim',
  },
  {
    'neovim/nvim-lspconfig',
  },
  {
    'j-hui/fidget.nvim',
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
  },
  {
    'jay-babu/mason-null-ls.nvim',
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },
  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim',
    },
  },
  {
    'glepnir/lspsaga.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'nvim-treesitter/nvim-treesitter',
    }
  },
})

require("autocmd")
require("options")
require("keymaps")
