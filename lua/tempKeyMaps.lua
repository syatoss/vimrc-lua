vim.g.mapleader = " "

-- window navigation
vim.keymap.set('n','<leader>h', ':wincmd h  <CR>')
vim.keymap.set('n','<leader>j', ':wincmd j  <CR>')
vim.keymap.set('n','<leader>k', ':wincmd k  <CR>')
vim.keymap.set('n','<leader>l', ':wincmd l  <CR>')

-- file operations
vim.keymap.set('n','ge', '$')
vim.keymap.set('n','<leader>s', ':w!<CR>')
vim.keymap.set('n','<leader>q', ':q!<CR>')

-- control keymaps
vim.keymap.set("v","J",":m '>+1<CR>gv=gv")
vim.keymap.set("v","K",":m '<-2<CR>gv=gv")
vim.keymap.set('n','<C-d>','<C-d>zz')
vim.keymap.set('n','<C-u>','<C-u>zz')
vim.keymap.set('n','n','nzzzv')
vim.keymap.set('n','N','Nzzzv')
vim.keymap.set('x','<leader>p',"\"_dp")

-- copy from vim commands
vim.keymap.set('n','<leader>y',"\"+y")
vim.keymap.set('v','<leader>y',"\"+y")
vim.keymap.set('n','<leader>Y',"\"+y")

