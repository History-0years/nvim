require('config.EcoVim')                   -- support global variables

require('utils.globals')
require('utils.functions')

require('config.options')                  -- basic config of nvim
require('config.keymappings')              -- all keymappings including plugins'

require('config.lazy')                     -- plugins management
require('config.autocmds')

require('lsp.config')
require('lsp.setup')
require('lsp.functions')

-- require('internal.cursorword')
-- require('internal.winbar')

-- require('snippets.react')
