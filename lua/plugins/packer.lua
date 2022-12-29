vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'hoob3rt/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use 'Yggdroot/indentLine'
  use 'liuchengxu/vista.vim'
  --use 'nvim-treesitter/nvim-treesitter'
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig'
  }
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'windwp/nvim-autopairs'
  use 'tanvirtin/monokai.nvim'
  use {
    'akinsho/bufferline.nvim',
    branch='main'
  }
  use 'nvim-lua/plenary.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'rktjmp/lush.nvim'
  use 'ellisonleao/gruvbox.nvim'
  use 'simrat39/symbols-outline.nvim'
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  use 'ojroques/nvim-lspfuzzy'
  use 'folke/tokyonight.nvim'
  use 'RRethy/vim-illuminate'
  use 'ibhagwan/fzf-lua'
  use 'vijaymarupudi/nvim-fzf'
  use 'sindrets/diffview.nvim'
  use 'folke/trouble.nvim'

  use 'nvim-tree/nvim-web-devicons'
  use {'romgrk/barbar.nvim', wants = 'nvim-web-devicons'}

  use {
      'johnfrankmorgan/whitespace.nvim',
      config = function ()
          require('whitespace-nvim').setup({
              highlight = 'DiffDelete',
              ignored_filetypes = { 'TelescopePrompt', 'Trouble', 'help' },
          })
          -- remove trailing whitespace with a keybinding
          vim.keymap.set('n', '<Leader>t', require('whitespace-nvim').trim)
      end
  }
end)
