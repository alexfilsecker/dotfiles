-- Set leader key
vim.g.mapleader = " "

-- Acces Explorer
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- External clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', {})
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p', {})

-- Reset search highlighting
vim.keymap.set('n', '<leader>nh', vim.cmd.nohlsearch)

-- Move whole lines
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '>-2<CR>gv=gv")

