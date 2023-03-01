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
          "pylsp",
          "html",
        },
        automatic_installation = true,
      })

      local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
      if not status_ok then
        vim.notify("Problem with mason-lspconfig")
        return
      end

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
        vim.keymap.set("n", "<space>F", vim.lsp.buf.formatting, bufopts)
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
