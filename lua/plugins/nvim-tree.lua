-----------------------------------------------------------
-- File manager configuration file
-----------------------------------------------------------

local g = vim.g

-- Plugin: nvim-tree
--- https://github.com/kyazdani42/nvim-tree.lua
g.nvim_tree_width = 27
-- g.nvim_tree_ignore = {'.git', 'node_modules', '.cache'}
-- g.nvim_tree_gitignore = 1
-- g.nvim_tree_indent_markers = 1
-- g.nvim_tree_hide_dotfiles = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_width_allow_resize  = 1
g.nvim_tree_special_files = {'README.md', 'Makefile', 'MAKEFILE'}
g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1
}

g.nvim_tree_icons = {
	default = "‣ "
}

require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  auto_close          = false,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  hide_dotfiles       = true,
  tree_indent_markers = true,
  ignore = {'.git', 'node_modules', '.cache'},
  diagnostics         = {
        enable = false,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        }
      },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  view = {
    width = 30,
    side = 'left',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    }
  },
  git = {
    ignore = true
  }
}

-- Keybindings are defined in `keymapping.lua`
--- See: `help NvimTree`
--- https://github.com/kyazdani42/nvim-tree.lua#keybindings

