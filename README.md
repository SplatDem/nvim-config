![nvim-config](./nvim-config.png)
> This is a neovide btw

### Package manager
[packer.nvim](https://github.com/wbthomason/packer.nvim)

### Plugins count
15

### Must have plugins
 - [nvim-tree](github.com/nvim-tree/nvim-tree.lua)
 - [nvim-treesitter](github.com/nvim-treesitter/nvim-treesitter)
 - [toggleterm.nvim](github.com/akinsho/toggleterm.nvim)
 - [lualine.nvim](github.com/nvim-lualine/lualine.nvim)
 - [nvim-cmp](github.com/hrsh7th/nvim-cmp)
 - [LuaSnip](github.com/L3MON4D3/LuaSnip)

### Keymaps
 - Alt+w - copy to system buffer
 - Ctrl+y - paste from system buffer
 - Ctrl+i - toggle float term
 - Alt+q - Telescope find files
 - Ctrl+Mouse wheel - change scale
 - Ctrl+Space in insert mod - show suggestions

### Default cmd settings ([config file](./lua/core/keymaps.lua))
 - noswapfile
 - termguicolors
 - autochdir
 - colorscheme [vscode](github.com/Mofiqul/vscode.nvim)
 - number
