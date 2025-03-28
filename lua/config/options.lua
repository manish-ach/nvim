-- show relative line number
vim.opt.number = true
vim.opt.relativenumber = false

-- indentations
vim.opt.expandtab = true --convert tabs to spaces
vim.opt.shiftwidth =  4 --amount to indent with << and >>
vim.opt.tabstop = 4 --spaces per tab
vim.opt.softtabstop = 4 --spaces when presing tab
vim.opt.autoindent = true --remember indentation from prev line
vim.opt.smarttab = true
-- vim.opt.smartindent = true

-- remember undo between sessions
vim.opt.undofile = true

-- show line under cursor
vim.opt.cursorline = true

-- mouse mode
vim.opt.mouse = "a"

-- toggle mode show [set false if status line is already showing]
vim.opt.showmode = false

-- case insensitive unless Uppercase letter used
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- keep signcolum on by default
vim.opt.signcolumn = "yes"

-- managing new split
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 5

-- disable the command line
-- vim.opt.cmdheight = 0

-- clipboard
vim.opt.clipboard = "unnamedplus"  -- Sync Neovim's clipboard with macOS clipboard


-- Highlight text for some time after yanking
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("YankHighlight", { 
        clear = true }),
    pattern = "*",
    callback = function()
        vim.highlight.on_yank()
    end,
    desc = "Highlight yank",
})

