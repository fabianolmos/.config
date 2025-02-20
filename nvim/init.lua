 -- Cargar configuraciones base
require('config.options')
require('config.keymaps')
require('config.autocmds')
require('config.env')
require('config.lazy')

-- Cargar gitsigns después de que los plugins estén configurados
require('gitsigns').setup({
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '-' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
})
-- Cargar plugins
require('plugins') 
