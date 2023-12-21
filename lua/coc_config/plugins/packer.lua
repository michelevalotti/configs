require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {'nvim-tree/nvim-web-devicons'}, -- optional, for file icons
  }
  use 'akinsho/toggleterm.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use { 'catppuccin/nvim', as = 'catppuccin'}

  use {'neoclide/coc.nvim', branch = 'release'}

  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  use 'mfussenegger/nvim-dap-python'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  }
  use 'nvim-telescope/telescope-dap.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run='make' }
  use 'mbbill/undotree'
  use 'folke/which-key.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'numToStr/Comment.nvim'
  use 'windwp/nvim-autopairs'
  use {
    'echasnovski/mini.starter',
    branch = 'stable',
    requires = {
      { 'echasnovski/mini.nvim', branch = 'stable' },
      { 'echasnovski/mini.sessions', branch = 'stable' }
    }
  }
end)
