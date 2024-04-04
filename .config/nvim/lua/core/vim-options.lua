-- tabs & indents
vim.opt.autoindent = true  -- Enable automatic indntation
vim.opt.expandtab = true   -- Transform tabs into spaces
vim.opt.tabstop = 2        -- Tabs use 2 spaces
vim.opt.softtabstop = 2    -- For editor purposes, does not change the file
vim.opt.shiftwidth = 2     -- For tabing with >> or <

-- line numbers
vim.opt.number = true          -- To show actual line number in left column
vim.opt.relativenumber = true  -- To show relative numbers in right column

-- colors
vim.opt.termguicolors = true  -- To use true colors

-- Recovery
vim.opt.swapfile = false                            -- No swap file
vim.opt.backup = false                              -- No backups
vim.undofile = true                                 -- Undo history saving
vim.undodir = os.getenv("HOME") .. "/.vim/undodir"  -- Path to save undoes

-- Searching
vim.opt.hlsearch = true   -- Highlight what you have searched for
vim.opt.incsearch = true  -- Search as you type

-- Scrolling
vim.opt.scrolloff = 8  -- Min number of lines to show when available

-- Wraping
vim.opt.wrap = false  -- Disables line wraping

