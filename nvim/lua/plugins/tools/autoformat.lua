return {
  'neovim/nvim-lspconfig',
  config = function()
    local format_is_enabled = true
    vim.api.nvim_create_user_command('KickstartFormatToggle', function()
      format_is_enabled = not format_is_enabled
      print('Autoformato ' .. (format_is_enabled and 'activado' or 'desactivado'))
    end, {})

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('LspAutoFormat', { clear = true }),
      callback = function(args)
        local client_id = args.data.client_id
        local client = vim.lsp.get_client_by_id(client_id)
        
        if client and client.server_capabilities.documentFormattingProvider then
          vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = args.buf,
            callback = function()
              if format_is_enabled then
                vim.lsp.buf.format({ async = false })
              end
            end
          })
        end
      end
    })
  end
}
