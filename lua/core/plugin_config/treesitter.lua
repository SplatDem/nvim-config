require 'nvim-treesitter.configs'.setup {
  ensuere_installed = { "c", "rust", "lua", "vim", "asm" },

  sync_install = false,
  auto_install = true,
  hightlight = {
    enable = true,
  },
}
