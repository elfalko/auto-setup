vim.lsp.config('*', {
  capabilities = {
    textDocument = {
      semanticTokens = {
        multilineTokenSupport = true,
      }
    }
  },
  root_markers = { '.git' },
})

-- :checkhealth vim.lsp

vim.lsp.enable('basedpyright')

vim.lsp.enable('bashls')

vim.lsp.config('luals', {
})

vim.lsp.enable('luals')
vim.lsp.enable('vimls')

-- :help lsp-defaults
-- :help diagnostic-defaults

-- ]d/[d      next/last diagnostic
-- ]D/[D      first/last diagnostic
-- leader + e to show error messages
-- C-w + d    same
-- gra + 1<CR>  to apply first fix

-- grr        references (where does this appear
-- gri        implementation
-- grt        definition
-- gO         document symbol

-- grn to rename

vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap=true, silent=true })



