return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "jay-babu/mason-null-ls.nvim",
    },
    opts = function()
      local present, null_ls = pcall(require, "null-ls")

      if not present then
        return
      end

      local b = null_ls.builtins

      local sources = {
        -- format html and markdown
        b.formatting.prettier.with({ filetypes = { "html", "yaml", "markdown" } }),
        b.formatting.isort, -- Python
        b.formatting.autopep8, -- Python
        b.diagnostics.pylint, -- Python
        b.formatting.shfmt, -- Shell script
        b.formatting.stylua, -- Lua
        b.formatting.prettier, -- HTML et.al.
      }

      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
      local on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
              --vim.lsp.buf.formatting_sync()
              vim.lsp.buf.format({ bufnr = bufnr })
            end,
          })
        end
      end

      null_ls.setup({
        debug = false,
        sources = sources,
        on_attach = on_attach,
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
          -- "isort",
          -- "autopep8",
          -- "shfmt",
          -- "stylua",
          -- "prettier",
          -- "pylint",
        },
      })
    end,
  },
}
