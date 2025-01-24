return {
  -- Packer can manage itself
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons'}
  },
  { 'nvim-tree/nvim-tree.lua' },
  { 'Yggdroot/indentLine' },
  { 'nvim-treesitter/nvim-treesitter' },
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-path' },
  { 'L3MON4D3/LuaSnip' },
  { 'saadparwaiz1/cmp_luasnip' },

  { 'windwp/nvim-autopairs' },
  -- Color theme
  -- use 'tanvirtin/monokai.nvim'
  -- { 'marko-cerovac/material.nvim' },
  {
    'akinsho/bufferline.nvim',
    branch='main'
  },
  { 'nvim-lua/plenary.nvim' },
  { 'lewis6991/gitsigns.nvim' },
  { 'hedyhli/outline.nvim' },
  { 'RRethy/vim-illuminate' },
  {
    'nvim-telescope/telescope.nvim', -- , tag = '0.1.3'
  -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  },
  {
    'NeogitOrg/neogit',
    requires = {{ 'nvim-lua/plenary.nvim' }},
    dependencies = { 'nvim-telescope/telescope.nvim' }
  },
  { 'aaronhallaert/advanced-git-search.nvim' },
  { 'sindrets/diffview.nvim' },
  { 'folke/trouble.nvim' },
  {'romgrk/barbar.nvim', wants = 'nvim-web-devicons'},
  {
      'johnfrankmorgan/whitespace.nvim',
      config = function ()
          require('whitespace-nvim').setup({
              highlight = 'DiffDelete',
              ignored_filetypes = { 'TelescopePrompt', 'Trouble', 'help' },
          })
          -- remove trailing whitespace with a keybinding
          vim.keymap.set('n', '<Leader>t', require('whitespace-nvim').trim)
      end
  },
  { 'b0o/schemastore.nvim' },
  { 'FabijanZulj/blame.nvim' },
  { 'folke/tokyonight.nvim' },
  { 'folke/zen-mode.nvim' },
  { 'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  { 'github/copilot.vim' },
  {
    'ibhagwan/fzf-lua',
    -- optional for icon support
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {}
  }
}
