-- Configuración específica del entorno
vim.env.PATH = vim.env.PATH .. [[
:/home/innovex/git/oxycontroller/**
:/home/innovex/zephyrproject/zephyr/**
]]

vim.opt.tags = {
  './tags',
  '/home/innovex/hg/tags',
  -- ... resto de paths
}
