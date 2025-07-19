vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.smarttab = true

vim.keymap.set({ "n", "v" }, "<A-w>", '"+y', { noremap = true, silent = true})
vim.keymap.set({"n", "v", "i"}, "<C-y>", '"+p<CR>', { noremap = true, silent = true})
vim.keymap.set("n", "<C-i>", ":ToggleTerm direction=float<CR>", { noremap = true, silent = true})
vim.keymap.set("n", "<A-q>", ":Telescope find_files<CR>", { noremap = true, silent = true})

vim.keymap.set({ "n", "v" }, "<C-ScrollWheelUp>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
vim.keymap.set({ "n", "v" }, "<C-ScrollWheelDown>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")

vim.cmd [[ set noswapfile ]]
vim.cmd [[ set termguicolors ]]
vim.cmd [[ set autochdir ]]
vim.cmd [[ colorscheme vscode ]]

--Line numbers
vim.wo.number = true
