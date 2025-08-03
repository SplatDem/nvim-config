local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-treesitter/nvim-treesitter'
  use 'p00f/clangd_extensions.nvim'
  use({
    "neanias/everforest-nvim",
    config = function()
      require("everforest").setup()
    end,
  })
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end}
  use 'nyoom-engineering/oxocarbon.nvim'
  use 'neovim/nvim-lspconfig'
  use 'mrcjkb/rustaceanvim'
  use 'OmniSharp/omnisharp-vim'
  use 'Mofiqul/vscode.nvim'
  use 'vague2k/vague.nvim'
  use({
    "L3MON4D3/LuaSnip",
    tag = "v2.*",
  })
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp",
            'quangnguyen30192/cmp-nvim-ultisnips', 'hrsh7th/cmp-nvim-lua',
            'octaltree/cmp-look', 'hrsh7th/cmp-path', 'hrsh7th/cmp-calc',
            'f3fora/cmp-spell', 'hrsh7th/cmp-emoji'
        }
    }
    use {
        'tzachar/cmp-tabnine',
        run = './install.sh',
        requires = 'hrsh7th/nvim-cmp'
    }
  use({ "iamcco/markdown-preview.nvim", run = function() vim.fn["mkdp#util#install"]() end})
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'nvim-tree/nvim-web-devicons'
  use ({ 
    'brenoprata10/nvim-highlight-colors',
    config = function()
      require("nvim-highlight-colors").setup()
    end
  })

  if packer_bootstrap then
    require('packer').sync()
  end
end)
