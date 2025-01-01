-----------------------------------------------------------
-- Statusline configuration file
-----------------------------------------------------------

-- Plugin: lualine
-- https://github.com/hoob3rt/lualine.nvim

require('lualine').setup {
  options = {
    theme = 'material',
    icons_enabled = true,
    extensions = {'nvim-tree'},
  };
  sections = {lualine_a = {'nvim_treesitter#statusline'}};
}
