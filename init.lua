--[[

  ██╗███╗   ██╗██╗████████╗██╗     ██╗   ██╗ █████╗
  ██║████╗  ██║██║╚══██╔══╝██║     ██║   ██║██╔══██╗
  ██║██╔██╗ ██║██║   ██║   ██║     ██║   ██║███████║
  ██║██║╚██╗██║██║   ██║   ██║     ██║   ██║██╔══██║
  ██║██║ ╚████║██║   ██║██╗███████╗╚██████╔╝██║  ██║
  ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝

Neovim init file

Version: 0.16.1_alpha - 2021/09/16
Maintainer: Brainf+ck
Website: https://github.com/brainfucksec/neovim-lua

--]]

vim.g.mapleader = ','             -- change leader to a comma
-----------------------------------------------------------
-- Import Lua modules
-----------------------------------------------------------
require("config.lazy")
require('settings')                 -- settings
require('keymaps')                  -- keymaps
require('plugins/nvim-tree')	      -- file manager
require('plugins/lualine')          -- statusline
require('plugins/nvim-cmp')         -- autocomplete
-- require('plugins/vista')            -- tag viewer
require('plugins/nvim-treesitter')  -- tree-sitter interface
require('plugins/nvim-autopairs')   -- autopairs
require('plugins/mason')            -- mason configuration
require('plugins/nvim-lspconfig')   -- LSP settings

