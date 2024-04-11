-- Set leader key
vim.g.mapleader = " "

-- Acces Explorer
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Navigate vim panes
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- External clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', {})
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p', {})

-- Reset search highlighting
vim.keymap.set('n', '<leader>hn', vim.cmd.nohlsearch)

-- Move whole lines
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '>-2<CR>gv=gv")

-- Split views
vim.keymap.set('n', '<leader>|', vim.cmd.vsplit)
vim.keymap.set('n', '<leader>-', vim.cmd.split)
