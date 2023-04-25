require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "pyright"}
})

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

require("lspconfig").lua_ls.setup{}
require("lspconfig").pyright.setup{}
require("lspconfig").clangd.setup{}
require("lspconfig").rust_analyzer.setup{}

local lspconfig = require 'lspconfig'
local configs = require 'lspconfig.configs'
-- Check if the config is already defined (useful when reloading this file)
if not configs.suricata_language_server then
  configs.suricata_language_server = {
    default_config = {
      cmd = {'suricata-language-server'};
      filetypes = {'suricata', 'hog'};
      root_dir = function(fname)
        return lspconfig.util.find_git_ancestor(fname)
      end;
      single_file_support = true;
      settings = {};
    };
  }
end

local suricata_ls_cmd = {'suricata-language-server', '--suricata-binary=/home/eric/builds/suricata/bin/suricata',  '--suricata-config=/home/eric/builds/suricata/etc/suricata/suricata-sls.yaml'}
require('lspconfig').suricata_language_server.setup {
  cmd = suricata_ls_cmd,
  on_attach = on_attach,
}
