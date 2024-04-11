-- This plugin lets me move to tmux panes with Ctrl + hjkl

return {
  "christoomey/vim-tmux-navigator",
  vim.keymap.set('n', 'C-h', ':TmuxNavigateLeft<CR>'),
  vim.keymap.set('n', 'C-j', ':TmuxNavigateDown<CR>'),
  vim.keymap.set('n', 'C-k', ':TmuxNavigateUp<CR>'),
  vim.keymap.set('n', 'C-l', ':TmuxNavigateRight<CR>'),
} 

