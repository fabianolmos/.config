local api = vim.api

-- Resaltar texto yank
api.nvim_create_autocmd('TextYankPost', {
  group = api.nvim_create_augroup('YankHighlight', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
  pattern = '*',
})

-- Formateo automático para LSP
api.nvim_create_autocmd('LspAttach', {
  group = api.nvim_create_augroup('LspFormatting', { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.documentFormattingProvider then
      api.nvim_create_autocmd('BufWritePre', {
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ async = false })
        end
      })
    end
  end
})
