vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.gitgutter_highlight_linenrs = 1

vim.opt.termguicolors = false
vim.cmd.set "number"

vim.o.timeoutlen = 500  -- keystroke timeout for combined keybindings and whichkey (default is 1000)
vim.o.updatetime = 100  -- used by signify, writes swapfile to disk after n ms (default is 4000)
vim.o.signcolumn = "yes:1"  -- signcol always on and 1 char wide

vim.o.expandtab = true
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
