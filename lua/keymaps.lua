-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")
-- Launch Telescope main window
vim.keymap.set("n", "<c-t>", ":Telescope<CR>")

-- Setting up register for 'which key' with keymappings
local wk = require("which-key")
wk.register({

  ["<leader>."] = { "<cmd>Neotree toggle<cr>", "Toggle Neo Tree" },
  ["<leader>M"] = { "<cmd>Mason<cr>", "Mason package manager" },
  ["<leader>T"] = { "<cmd>Telescope<cr>", "Telescope search" },
  -- Switch between open tabs
  ["<leader>1"] = { "1gt<cr>", "Tab 1" },
  ["<leader>2"] = { "2gt<cr>", "Tab 2" },
  ["<leader>3"] = { "3gt<cr>", "Tab 3" },
  ["<leader>4"] = { "4gt<cr>", "Tab 4" },
  ["<leader>5"] = { "5gt<cr>", "Tab 5" },
  ["<leader>6"] = { "6gt<cr>", "Tab 6" },

  ["<leader>"] = {
    c = {
      name = "Code",
      f = { "<cmd>lua vim.lsp.buf.format({ timeout_ms = 2000 })<CR>", "Format" },
      a = { "<cmd>Lspsaga code_action<CR>", "Action" },
      r = { "<cmd>Lspsaga rename<CR>", "Action" },
      l = { "<cmd>Lspsaga lsp_finder<CR>", "LSP Finder" },
      g = { "<cmd>Lspsaga goto_definition<CR>", "LSP Finder" },
      k = { "<cmd>Lspsaga hover_doc<CR>", "LSP Doc" },
      h = { "<cmd>set list!<CR>", "Hidden Characters Toggle" },
    },
    d = {
      name = "Diagnostics",
      l = { "<cmd>Lspsaga show_line_diagnostics<CR>", "Diagnostics Line" },
      c = { "<cmd>Lspsaga show_line_diagnostics<CR>", "Diagnostics Cursor" },
      b = { "<cmd>Lspsaga show_buf_diagnostics<CR>", "Diagnostics Buffer" },
    },
    f = {
      name = "Find",
      f = { "<cmd>Telescope find_files<cr>", "Files" },
      r = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
      b = { "<cmd>Telescope file_browser<cr>", "File Browser" },
      t = { "<cmd>Telescope<cr>", "Telescope" },
      h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
      B = { "<cmd>Telescope buffers<cr>", "Buffers" },
      g = { "<cmd>Telescope grep_string<cr>", "Grep recursive" },
      s = { "<cmd>Telescope live_grep<cr>", "Strings in file" },
    },
    g = {
      name = "Git",
      s = { "<cmd>Telescope git_status<cr>", "Status" },
      d = { "<cmd>Git diff<cr>", "Diff" },
      p = { "<cmd>Git pull<cr>", "Pull" },
      l = { "<cmd>Git log --oneline<cr>", "log --oneline" },
      L = { "<cmd>Git log<cr>", "log" },
    },
    p = {
      name = "Packer",
      s = { "<cmd>PackerSync<cr>", "Sync" },
      c = { "<cmd>PackerCompile<cr>", "Compile" },
    },
    t = {
      name = "Tab",
      n = { "<cmd>tabnew<cr>", "New" },
      c = { "<cmd>tabclose<cr>", "Close" },
      x = { "<cmd>tabonly<cr>", "Close all tabs" },

    },
  },
})
