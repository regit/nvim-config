-----------------------------------------------------------
-- Keymaps configuration file: keymaps of neovim
-- and plugins.
-----------------------------------------------------------

local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

-----------------------------------------------------------
-- Neovim shortcuts:
-----------------------------------------------------------

-- clear search highlighting
map('n', '<leader>c', ':nohl<CR>', default_opts)

-- map Esc to kk
-- map('i', 'kk', '<Esc>', {noremap = true})

-- don't use arrow keys
-- map('', '<up>', '<nop>', {noremap = true})
-- map('', '<down>', '<nop>', {noremap = true})
-- map('', '<left>', '<nop>', {noremap = true})
-- map('', '<right>', '<nop>', {noremap = true})

-- fast saving with <leader> and s
map('n', '<leader>s', ':w<CR>', default_opts)
map('i', '<leader>s', '<C-c>:w<CR>', default_opts)

-- move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h', default_opts)
map('n', '<C-j>', '<C-w>j', default_opts)
map('n', '<C-k>', '<C-w>k', default_opts)
map('n', '<C-l>', '<C-w>l', default_opts)

-- close all windows and exit from neovim
map('n', '<leader>q', ':quitall<CR>', default_opts)

-- basic autopair
-- Use this if you don't want a plugin for brackets autopairs
-- slow when closing "{}" :(

--[[
map('i', '"', '""<left>', default_opts)
map('i', '`', '``<left>', default_opts)
map('i', '(', '()<left>', default_opts)
map('i', '[', '[]<left>', default_opts)
map('i', '{', '{}<left>', default_opts)
map('i', '{<CR>', '{<CR}<ESC>0', default_opts)
map('i', '{;<CR>', '{<CR};<ESC>0', default_opts)
--]]

-----------------------------------------------------------
-- Plugins shortcuts:
-----------------------------------------------------------
-- nvim-tree
-- all shotcuts https://github.com/kyazdani42/nvim-tree.lua
map('n', '<F2>', ':NvimTreeToggle<CR>', default_opts)       -- open/close
map('n', '<F3>', ':SymbolsOutline<CR>', default_opts)       -- open/close

map('', '<leader>r', ':NvimTreeRefresh<CR>', default_opts)  -- refresh
map('', '<leader>f', ':NvimTreeFindFile<CR>', default_opts) -- search file

-- Vista
-- map('', '<C-J>', ':SymbolsOutline<CR>', default_opts)  -- open/close vista window
-- map('', '<C-J>', ':SymbolsOutline focus<CR>', default_opts)  -- open/close + focus vista window

map('', '<m-m>', ':BookmarkToggle<CR>', default_opts)
map('', '<m-n>', ':BookmarkNext<CR>', default_opts)
map('', '<m-b>', ':BookmarkPrev<CR>', default_opts)
map('', '<m-a>', ':BookmarkShowAll<CR>', default_opts)

map('', '<A-n>', ':BufferLineCycleNext<CR>', default_opts)
map('', '<A-b>', ':BufferLineCyclePrev<CR>', default_opts)
map('', '<A-N>', ':BufferLineMoveNext<CR>', default_opts)
map('', '<A-B>', ':BufferLineMovePrev<CR>', default_opts)

map('', '<C-F>', ':FZF<CR>', default_opts)
map('', '<ESC>', ':noh<CR>', {noremap = true})

function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",
  {silent = true, noremap = true}
)
