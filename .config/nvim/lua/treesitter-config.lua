require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "rust" },  -- list of language that will be disabled
  },
  indent = {
  enable = true
  }
  }
