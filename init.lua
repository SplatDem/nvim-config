vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.number = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.smarttab = true

vim.opt.guifont = "CaskaydiaMono Nerd Font"
vim.opt.termguicolors = true

vim.keymap.set({ "n", "v"}, "<A-w>", '"+y', { noremap = true, silent = true})
vim.keymap.set({"n", "v", "i"}, "<C-y>", '"+p<CR>', { noremap = true, silent = true})
vim.keymap.set("n", "<C-i>", ":ToggleTerm direction=float<CR>", { noremap = true, silent = true})
vim.keymap.set("n", "<A-q>", ":Telescope find_files<CR>", { noremap = true, silent = true})
vim.keymap.set("t", "<Esc>", [[ <C-\><C-n> ]], {noremap = true, silent = true})
vim.keymap.set({"n", "i"}, "<A-x>", vim.diagnostic.open_float)

vim.keymap.set({ "n", "v", "i" }, "<C-ScrollWheelUp>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
vim.keymap.set({ "n", "v", "i" }, "<C-ScrollWheelDown>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")

vim.cmd [[ set noswapfile ]]
vim.cmd [[ set termguicolors ]]
vim.cmd [[ set autochdir ]]

vim.pack.add({
  { src = "https://github.com/vague2k/vague.nvim" },
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/p00f/clangd_extensions.nvim" },
  { src = "https://github.com/akinsho/toggleterm.nvim" },
  { src = "https://github.com/mrcjkb/rustaceanvim" },

  { src = "https://github.com/hrsh7th/nvim-cmp" },
  { src = "https://github.com/hrsh7th/cmp-buffer" },
  { src = "https://github.com/hrsh7th/cmp-path" },
--   { src = "https://github.com/hrsh7th/cmp-buffer" },
--   { src = "https://github.com/hrsh7th/cmp-buffer" },
--   { src = "https://github.com/hrsh7th/cmp-buffer" },
--   { src = "https://github.com/hrsh7th/cmp-buffer" },
  { src = "https://github.com/L3MON4D3/LuaSnip" },
  { src = "https://github.com/tzachar/cmp-tabnine" },

  { src = "https://github.com/nvim-lualine/lualine.nvim" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/brenoprata10/nvim-highlight-colors" },
})

-- vim.cmd [[ colorscheme vague ]]

require("nvim-highlight-colors").setup()

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
    -- section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
      refresh_time = 16, -- ~60fps
      events = {
        'WinEnter',
        'BufEnter',
        'BufWritePost',
        'SessionLoadPost',
        'FileChangedShellPost',
        'VimResized',
        'Filetype',
        'CursorMoved',
        'CursorMovedI',
        'ModeChanged',
      },
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

-- import nvim-cmp plugin safely
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
  return
end

-- import luasnip plugin safely
local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
  return
end

-- load VSCode-like snippets from plugins (e.g., friendly-snippets)

require("luasnip/loaders/from_vscode").lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
    ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
    ["<Tab>"] = cmp.mapping.select_next_item(), -- next suggestion
    ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- previous suggestion
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
    ["<C-e>"] = cmp.mapping.abort(), -- close completion window
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
  }),
  -- sources for autocompletion
  sources = cmp.config.sources({
    { name = "nvim_lsp" }, -- LSP
    { name = "luasnip" }, -- snippets
    { name = "buffer" }, -- text within the current buffer
    { name = "path" }, -- file system paths
  }),
})
