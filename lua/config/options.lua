vim.opt.clipboard = "unnamedplus"

-- show relative line number
vim.opt.number = true
vim.opt.relativenumber = false

-- indentations
vim.opt.expandtab = true --convert tabs to spaces
vim.opt.shiftwidth = 4 --amount to indent with << and >>
vim.opt.tabstop = 4 --spaces per tab
vim.opt.softtabstop = 4 --spaces when presing tab
vim.opt.autoindent = true --remember indentation from prev line
vim.opt.smarttab = true
vim.opt.smartindent = true

-- remember undo between sessions
vim.opt.undofile = true

-- show line under cursor
vim.opt.cursorline = true

-- case insensitive unless Uppercase letter used
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 5
