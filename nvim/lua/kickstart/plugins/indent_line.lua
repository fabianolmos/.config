return {
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {
      indent = {
        char = '│', -- Carácter que se usa para la línea de indentación
        tab_char = '│', -- Carácter que se usa para la indentación de tabulaciones
      },
      scope = {
        enabled = true, -- Habilita la visualización del alcance (scope)
        show_start = true, -- Muestra el inicio del alcance
        show_end = true, -- Muestra el final del alcance
      },
      exclude = {
        filetypes = {
          'help',
          'alpha',
          'dashboard',
          'neo-tree',
          'Trouble',
          'lazy',
          'mason',
          'notify',
          'toggleterm',
          'lazyterm',
        },
      },
    },
  },
}
