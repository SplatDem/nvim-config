local builtin = require('telescope.builtin')
vim.keymap.set('n', '<Space>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<Space>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<Space>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<Space>fh', builtin.help_tags, { desc = 'Telescope help tags' })

--[[
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<c-p>', builtin.find_files, {})
vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, {})
vim.keymap.set('n', '<Space>fg', builtin.live_grep, {})
vim.keymap.set('n', '<Space>fn', builtin.help_tags, {})
--]]
