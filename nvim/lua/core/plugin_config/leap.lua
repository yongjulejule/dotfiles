local leap = require('leap')

leap.opts.equivalence_classes = { ' \t\r\n', '([{', ')]}', '\'"`' }


vim.keymap.set('n', 's', '<Plug>(leap)')
vim.keymap.set('n', 'S', '<Plug>(leap-from-window)')
