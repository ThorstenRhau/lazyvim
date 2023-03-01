return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
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
          null_ls.builtins.formatting.prettier, -- HTML et.al.
        },
      })
    end,
  },
  ------------------------------------------------------------------------------
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = function()
      require("mason-null-ls").setup({
        ensure_installed = {
          "isort",
          "autopep8",
          "shfmt",
          "stylua",
          "prettier",
        },
      })
    end,
  },
}
