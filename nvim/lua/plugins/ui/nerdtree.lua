return {
  'preservim/nerdtree',
  config = function()
    vim.g.NERDSpaceDelims = 1
    vim.g.NERDCompactSexyComs = 1
    vim.g.NERDDefaultAlign = 'left'
    
    vim.keymap.set('n', '<leader>nn', '<cmd>NERDTreeToggle<cr>', { desc = 'Abrir/cerrar NERDTree' })
    vim.keymap.set('n', '<leader>nf', '<cmd>NERDTreeFind<cr>', { desc = 'Buscar archivo en NERDTree' })
  end
}
