require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "terraformls", "ts_ls" },
})

-- 1. 공통 Capabilities 설정 (v0.11 Native 방식)
-- 모든 서버에 nvim-cmp 기능을 자동으로 적용합니다.
vim.lsp.config('*', {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

-- 2. Lua 설정 (vim.lsp.config 사용)
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
    },
  }
})

-- 3. 서버 활성화 (setup() 대신 enable() 사용)
vim.lsp.enable('lua_ls')
vim.lsp.enable('gleam')
vim.lsp.enable('terraformls')
-- 필요 시 아래 주석 해제 (ensure_installed에 있는 것들)
-- vim.lsp.enable('ts_ls')
-- vim.lsp.enable('eslint')


-- 4. Keymaps (LspAttach 이벤트 사용 - 기존 유지)
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to declaration', buffer = ev.buf })
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition', buffer = ev.buf })
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'Go to References', buffer = ev.buf })
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = 'Go to implementation', buffer = ev.buf })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Show LSP hover', buffer = ev.buf })
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, { desc = 'Add workspace folder', buffer = ev.buf })
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder,
      { desc = 'Remove workspace folder', buffer = ev.buf })
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, { desc = 'List workspace folders', buffer = ev.buf })
    vim.keymap.set('n', '<space>gtd', vim.lsp.buf.type_definition, { desc = 'Go to type definition', buffer = ev.buf })
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, { desc = 'LSP Refactor: Rename', buffer = ev.buf })
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, { desc = 'LSP Code Action', buffer = ev.buf })
  end,
})
