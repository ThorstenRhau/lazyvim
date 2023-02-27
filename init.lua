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
  ------------------------------------------------------------------------------
  {
    "folke/which-key.nvim",
    opts = {},
    event = "BufReadPost",
  },
  ------------------------------------------------------------------------------
  {
    "nvim-tree/nvim-web-devicons",
  },
  ------------------------------------------------------------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "markdown",
        "markdown_inline",
        "vim",
      },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
      },
    },
  },
  ------------------------------------------------------------------------------
  {
    "lewis6991/gitsigns.nvim",
    opts = {},
  },
  ------------------------------------------------------------------------------
  {
    "tpope/vim-fugitive",
  },
  ------------------------------------------------------------------------------
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs( -4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-o>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "path" },
          { name = "buffer", keyword_length = 5 },
        }),
      })
    end,
  },
  ------------------------------------------------------------------------------
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  ------------------------------------------------------------------------------
  {
    "hrsh7th/cmp-buffer",
  },
  ------------------------------------------------------------------------------
  {
    "hrsh7th/cmp-path",
  },
  ------------------------------------------------------------------------------
  {
    "L3MON4D3/LuaSnip",
  },
  ------------------------------------------------------------------------------
  {
    "saadparwaiz1/cmp_luasnip",
  },
  ------------------------------------------------------------------------------
  {
    "rafamadriz/friendly-snippets",
  },
  ------------------------------------------------------------------------------
  {
    "goolord/alpha-nvim",
    config = function()
      require("alpha").setup(require("alpha.themes.startify").config)
    end,
  },
  ------------------------------------------------------------------------------
  {
    "windwp/nvim-autopairs",
    opts = {
      disable_filetype = { "TelescopePrompt", "vim" },
    },
  },
  ------------------------------------------------------------------------------
  {
    "anuvyklack/pretty-fold.nvim",
  },
  ------------------------------------------------------------------------------
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      show_current_context = true,
      show_current_context_start = true,
    },
  },
  ------------------------------------------------------------------------------
  {
    "crispgm/nvim-tabline",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  ------------------------------------------------------------------------------
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  },
  ------------------------------------------------------------------------------
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      extensions = { "quickfix", "fugitive", "symbols-outline" },
    },
  },
  ------------------------------------------------------------------------------
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      "jose-elias-alvarez/null-ls.nvim",
      "jay-babu/mason-null-ls.nvim",
    },
    opts = function()
      require("mason").setup({
        ui = {
          check_outdated_packages_on_open = true,
          max_concurrent_installers = 4,

          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },
  ------------------------------------------------------------------------------
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function()
      local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
      if not status_ok then
        vim.notify("Problem with mason-lspconfig")
        return
      end

      mason_lspconfig.setup({
        automatic_installation = true,
      })

      ---@diagnostic disable-next-line: unused-local
      local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
      if not status_ok then
        vim.notify("Problems with lspconfig")
        return
      end

      ---@diagnostic disable-next-line: unused-local
      local on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
        vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
        vim.keymap.set("n", "<space>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, bufopts)
        vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
        vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
        vim.keymap.set("n", "<space>f", vim.lsp.buf.formatting, bufopts)
      end

      mason_lspconfig.setup_handlers({

        -- This is a default handler that will be called for each installed server
        -- (also for new servers that are installed during a session)
        function(server_name)
          lspconfig[server_name].setup({
            on_attach = on_attach,
            flags = lsp_flags,
          })
        end,
      })
    end,
  },
  ------------------------------------------------------------------------------
  {
    "neovim/nvim-lspconfig",
  },
  ------------------------------------------------------------------------------
  {
    "j-hui/fidget.nvim",
    opts = function()
      require("fidget").setup()
    end,
  },
  ------------------------------------------------------------------------------
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      "jay-babu/mason-null-ls.nvim",
    },
    opts = function()
      local null_ls = require("null-ls")
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.isort, -- Python
          null_ls.builtins.formatting.autopep8, -- Python
          null_ls.builtins.formatting.shfmt, -- Shell script
          null_ls.builtins.formatting.stylua, -- Lua
        },
      })
    end,
  },
  ------------------------------------------------------------------------------
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function()
      require("mason-null-ls").setup({
        ensure_installed = {
          "isort",
          "autopep8",
          "shfmt",
          "stylua",
        },
      })
    end,
  },
  ------------------------------------------------------------------------------
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    opts = function()
      require("telescope").setup({
        defaults = {
          layout_strategy = "vertical",
          layout_config = { height = 0.95 },
        },
        extensions = {
          file_browser = {
            theme = "ivy",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
              ["i"] = {
                -- your custom insert mode mappings
              },
              ["n"] = {
                -- your custom normal mode mappings
              },
            },
          },
        },
      })

      require("telescope").load_extension("file_browser")
    end,
  },
  ------------------------------------------------------------------------------
  {
    "nvim-telescope/telescope-file-browser.nvim",
  },
  ------------------------------------------------------------------------------
  {
    "glepnir/lspsaga.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-treesitter/nvim-treesitter",
    },
  },
  ------------------------------------------------------------------------------
  {
    "abecodes/tabout.nvim",
    dependencies = {
      "nvim-treesitter",
    },
    opts = function()
      require("tabout").setup({
        tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
        backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
        act_as_tab = true, -- shift content if tab out is not possible
        act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
        default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
        default_shift_tab = "<C-d>", -- reverse shift default action,
        enable_backwards = true, -- well ...
        completion = true, -- if the tabkey is used in a completion pum
        tabouts = {
          { open = "'", close = "'" },
          { open = '"', close = '"' },
          { open = "`", close = "`" },
          { open = "(", close = ")" },
          { open = "[", close = "]" },
          { open = "{", close = "}" },
        },
        ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
        exclude = {}, -- tabout will ignore these filetypes
      })
    end,
  },
  ------------------------------------------------------------------------------
})

require("autocmd")
require("options")
require("keymaps")
