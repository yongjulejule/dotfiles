local typescriptTools = require("typescript-tools")

typescriptTools.setup({
  -- NOTE: This seems done after save
  -- on_attach = function(client, bufnr)
  --   vim.api.nvim_create_autocmd('BufWritePre', {
  --     buffer = bufnr,
  --     command = "TSToolsOrganizeImports",
  --   })
  --   vim.api.nvim_create_autocmd('BufWritePre', {
  --     buffer = bufnr,
  --     command = "TSToolsFixAll",
  --   })
  -- end
})

vim.keymap.set('n', '<leader>tf', '<cmd>TSToolsFixAll<cr>')
vim.keymap.set('n', '<leader>to', '<cmd>TSToolsOrganizeImports<cr>')
