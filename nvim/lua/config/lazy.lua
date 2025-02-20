-- lua/config/lazy.lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Bootstrap lazy.nvim si no está instalado
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Plugins básicos sin configuración
  { "tpope/vim-fugitive" },  -- Git integration
  { "tpope/vim-rhubarb" },   -- GitHub integration
  { "tpope/vim-sleuth" },    -- Detect tabstop y shiftwidth automáticamente

  -- LSP y herramientas relacionadas
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      { "j-hui/fidget.nvim", opts = {} },  -- Notificaciones de LSP
      "folke/neodev.nvim",                 -- Configuración de Lua para Neovim
    },
  },

  -- Plugins de Core
  { import = "plugins.core.cmp" },
  { import = "plugins.core.lsp" },
  { import = "plugins.core.telescope" },
  { import = "plugins.core.treesitter" },

  -- Plugins de UI
  { import = "plugins.ui.gitsigns" },
  { import = "plugins.ui.colorscheme" },
  { import = "plugins.ui.comment" },
  { import = "plugins.ui.indent" },
  { import = "plugins.ui.lualine" },
  { import = "plugins.ui.nerdtree" },

  -- Plugins de Herramientas (Tools)
  { import = "plugins.tools.autoformat" },
  { import = "plugins.tools.debug" },
  { import = "plugins.tools.lazygit" },

  -- Agregar nvim-nio
  { "nvim-neotest/nvim-nio" }, -- Asegúrate de que esto esté aquí

  -- Agregar otros plugins si es necesario...
})
