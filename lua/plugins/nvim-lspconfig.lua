-----------------------------------------------------------
-- Neovim LSP configuration file
-----------------------------------------------------------

-- Plugin: nvim-lspconfig
-- for language server setup see: https://github.com/neovim/nvim-lspconfig


-- Add additional capabilities supported by nvim-cmp
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.documentationFormat = { 'markdown', 'plaintext' }
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- capabilities.textDocument.completion.completionItem.preselectSupport = true
-- capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
-- capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
-- capabilities.textDocument.completion.completionItem.deprecatedSupport = true
-- capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
-- capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
-- capabilities.textDocument.completion.completionItem.resolveSupport = {
--   properties = {
--     'documentation',
--     'detail',
--     'additionalTextEdits',
--   },
-- }

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.format()<CR>', opts)

end

--[[ Language servers:

Add here your language servers.

For language servers list see:
https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md


Bash --> bashls
https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#bashls

Python --> pyright
https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#pyright

C-C++ -->  clangd
https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#clangd

HTML/CSS/JSON --> vscode-html-languageserver
https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#html

JavaScript/TypeScript --> tsserver
https://github.com/typescript-language-server/typescript-language-server

--]]

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
-- local servers = { 'bashls', 'pyright', 'html', 'ts_ls', 'taplo' }
-- for _, lsp in ipairs(servers) do
--   vim.lsp.config(lsp).setup {
--     on_attach = on_attach,
--     flags = {
--       debounce_text_changes = 150,
--     }
--   }
-- end

local suricata_ls_cmd = {vim.fn.expand('$HOME/git/stamus/suricata-language-server/venv/bin/suricata-language-server'), vim.fn.expand('--suricata-binary=$HOME/builds/suricata/bin/suricata'), '--debug-log'}

vim.lsp.config('suricata_language_server',
  {
      cmd = suricata_ls_cmd;
      filetypes = {'suricata', 'hog'};
      root_dir = function(fname)
        return vim.lsp.config.util.find_git_ancestor(fname)
      end;
      single_file_support = true;
      settings = {};
      on_attach = on_attach,
  }
)

local clangd_cmd = {'clangd', '--header-insertion=never', '--offset-encoding=utf-16'}
vim.lsp.config('clangd', {
  cmd = clangd_cmd,
  on_attach = on_attach,
})

vim.lsp.config('rust_analyzer', {
  on_attach = on_attach,
  settings = {
    ['rust-analyzer'] = {
      cargo = {
        allFeatures = true,
      },
      procMacro = {
        enable = true,
      },
    },
  },
})

vim.lsp.config('jsonls', {
  debug = true,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas({
        extra = {
          {
            description = 'Suricata JSON schema',
            fileMatch = '*eve-single.json',
            name = 'suricata.json',
            url = '/home/eric/git/suricata/etc/schema.json',
          }
        }
      }),
      validate = { enable = true },
    },
  },
})

vim.lsp.config('yamlls', {
  settings = {
    yaml = {
      schemaStore = {
        -- You must disable built-in schemaStore support if you want to use
        -- this plugin and its advanced options like `ignore`.
        enable = false,
        -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
        url = "",
      },
      schemas = require('schemastore').yaml.schemas(),
    },
  },
})

vim.lsp.config('nil_ls', {})


local servers = { 'bashls', 'pyright', 'html', 'ts_ls', 'taplo', 'suricata_language_server', 'clangd', 'rust_analyzer', 'jsonls', 'yamlls', 'nil_ls' }
for _, lsp in ipairs(servers) do
  vim.lsp.enable(lsp)
end
