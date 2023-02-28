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

-- Colorscheme
vim.cmd([[ colorscheme tokyonight ]])
