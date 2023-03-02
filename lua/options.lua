local opt = vim.opt

opt.mouse = "nv" -- Mouse input only in 'normal' and 'visual' modes
opt.clipboard = "" -- Do not sync clipboard
opt.cursorline = true -- Highlight the current line
opt.autoread = true -- Read file changes
opt.cmdheight = 1 -- Number of lines to use for command line
opt.whichwrap = "<,>,h,l" -- Line wrap scrolling
opt.foldmethod = "expr" -- Folding with Treesitter
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false -- Don't fold by default
opt.number = true -- line numbers
opt.scrolloff = 6 -- Number of lines above and below the cursor
opt.winbar = "%=%m\\ %f" -- Setting windowsbar string
opt.ignorecase = true -- Ignore case
opt.smartcase = true -- Respect case for capital letters
opt.termguicolors = true -- 24bit colors
opt.winblend = 0
opt.wildoptions = "pum"
opt.pumblend = 5

opt.title = true
opt.autoindent = true
opt.smartindent = true
opt.hlsearch = true
opt.showcmd = true
opt.cmdheight = 1
opt.laststatus = 2
opt.backupskip = { "/tmp/*", "/private/tmp/*" }
opt.inccommand = "split"
opt.smarttab = true
opt.breakindent = true
opt.wrap = false -- No Wrap lines
opt.backspace = { "start", "eol", "indent" }
opt.path:append({ "**" }) -- Finding files - Search down into subfolders
opt.wildignore:append({ "*/node_modules/*" })

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })

-- use spaces for tabs and whatnot
opt.tabstop = 2
opt.shiftwidth = 2
opt.shiftround = true
opt.expandtab = true

-- Format options ,no help woth comments :-)
vim.cmd([[ autocmd FileType * set formatoptions-=cro ]])

-- No highlight search
vim.cmd([[ set nohlsearch ]])

opt.listchars = {
  -- Definíng symbols for hidden characters
  eol = "↴",
  tab = ">-",
  space = "⋅",
}

-- Neotree keymaps for v2.0
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
