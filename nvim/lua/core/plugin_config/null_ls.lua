-- local null_ls = require 'null-ls'
-- local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
--
-- null_ls.setup {
--   sources = {
--     null_ls.builtins.formatting.deno_fmt,
--     null_ls.builtins.formatting.prettier.with {
--       disabled_filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
--     }, -- use deno instead
--     -- null_ls.builtins.diagnostics.vale,
--   },
--   on_attach = function(client, bufnr)
--     if client.supports_method 'textDocument/formatting' then
--       vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
--       vim.api.nvim_create_autocmd('BufWritePre', {
--         group = augroup,
--         buffer = bufnr,
--         callback = function()
--           -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
--           vim.lsp.buf.format({bufnr = bufnr})
--           -- vim.lsp.buf.formatting_sync()
--         end,
--       })
--     end
--   end,
-- }
--
--
local null_ls = require("null-ls")

local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- or "BufWritePost"
local async = event == "BufWritePost"

null_ls.setup({
   sources = {
    null_ls.builtins.formatting.prettier.with {
      disabled_filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
    },
    null_ls.builtins.diagnostics.vale,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.keymap.set("n", "<Leader>f", function()
        vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
      end, { buffer = bufnr, desc = "[lsp] format" })

      -- format on save
      vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
      vim.api.nvim_create_autocmd(event, {
        -- if typescript, use :Prettier instead.
        -- if javascript, use :DenoFmt instead.
        -- if lua, use :lua vim.lsp.buf.formatting_sync() instead.
        -- if others, use :lua vim.lsp.buf.formatting() instead.
        buffer = bufnr,
        group = group,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr})
        end,
        desc = "[lsp] format on save",
      })
    end

    if client.supports_method("textDocument/rangeFormatting") then
      vim.keymap.set("x", "<Leader>f", function()
        vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
      end, { buffer = bufnr, desc = "[lsp] format" })
    end
  end,
})
