local typescriptTools = require("typescript-tools")

typescriptTools.setup({
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = bufnr,
      command = "TSToolsOrganizeImports",
    })
  end
})
