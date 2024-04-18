-- Set leader key
vim.g.mapleader = " "

-- Acces Explorer
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Navigate vim panes (same as in tmux)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>')

-- Resize panes
-- Could not make this to be as intuitive as in tmux
-- In tmux, pane resizing works by moving the line between panes
-- Here it makes a pane bigger or smaller so it is not an intuitive motion
vim.keymap.set('n', '<C-M-h>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<C-M-j>', ':resize -2<CR>')
vim.keymap.set('n', '<C-M-k>', ':resize +2<CR>')
vim.keymap.set('n', '<C-M-l>', ':vertical resize +2<CR>')

-- Split views
vim.keymap.set('n', '<leader>|', vim.cmd.vsplit)
vim.keymap.set('n', '<leader>-', vim.cmd.split)

-- External clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', {})
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p', {})

-- Reset search highlighting
vim.keymap.set('n', '<leader>hn', vim.cmd.nohlsearch)

-- Move whole lines
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '>-2<CR>gv=gv")


