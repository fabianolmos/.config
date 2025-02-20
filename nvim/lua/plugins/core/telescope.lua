return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
  },
  config = function()
    require("telescope").setup({
      extensions = {
        file_browser = {
          theme = 'ivy',
          hijack_netrw = true,
          mappings = {
            ['i'] = {
              vim.api.nvim_set_keymap('n', '<C-f>', ':Telescope file_browser<CR>', { noremap = true })
            },
            ['n'] = {
              vim.api.nvim_set_keymap('n', '<C-f>', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', { noremap = true })
            },
          },
        },
      },
      defaults = {
        mappings = {
          i = {
            ["<C-u>"] = false,
            ["<C-d>"] = false,
          },
        },
      },
    })

    pcall(require("telescope").load_extension("file_browser"))
    pcall(require("telescope").load_extension("fzf"))

    -- Keymaps (se moverán a keymaps.lua)
  end
}
