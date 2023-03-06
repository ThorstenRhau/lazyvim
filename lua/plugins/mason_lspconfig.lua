return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
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
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "bashls",
          "marksman",
          "pyright",
          "html",
        },
        automatic_installation = true,
      })

      require("mason-lspconfig").setup_handlers({
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup({})
        end,
      })
    end,
  },
  ------------------------------------------------------------------------------
  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
  },
  ------------------------------------------------------------------------------
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
  },
  ------------------------------------------------------------------------------
  {
    "j-hui/fidget.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = function()
      require("fidget").setup()
    end,
  },
}
