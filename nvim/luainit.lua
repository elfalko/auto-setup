-- autoloads nvim-lspconfig if missing
local path = vim.fn.stdpath("data") .. "/site/pack/nvim/start/nvim-lspconfig"

if vim.fn.empty(vim.fn.glob(path)) > 0 then
  vim.fn.system({
    "git", "clone", "--depth=1",
    "https://github.com/neovim/nvim-lspconfig",
    path,
  })
end

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


vim.lsp.enable('basedpyright')

vim.lsp.enable('bashls')

-- TODO why not in lspconfig
vim.lsp.config('luals', {})
vim.lsp.enable('luals')

vim.lsp.enable('vimls')

-- :checkhealth vim.lsp
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



