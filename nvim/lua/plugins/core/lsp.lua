-- lua/plugins/core/lsp.lua
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "j-hui/fidget.nvim",
    "folke/neodev.nvim",
    "hrsh7th/cmp-nvim-lsp",  -- Para integración con autocompletado
  },
  config = function()
    -- 1. Configurar Mason (gestor de paquetes para LSPs, linters y formatters)
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    })

    -- 2. Configurar mason-lspconfig (puente entre Mason y LSPConfig)
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",       -- Lua
        "pyright",      -- Python
        "clangd",       -- C/C++
        "rust_analyzer" -- Rust
      },
      automatic_installation = true,  -- Instalar LSPs automáticamente
    })

    -- 3. Configurar neodev (para desarrollo de plugins de Neovim en Lua)
    require("neodev").setup()

    -- 4. Configurar función on_attach (se ejecuta cuando un LSP se conecta)
    local on_attach = function(client, bufnr)
      -- Función auxiliar para mapear teclas
      local nmap = function(keys, func, desc)
        if desc then
          desc = "LSP: " .. desc
        end
        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
      end

      -- Mapeos básicos
      nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
      nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
      nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
      nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
      nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
      nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
      nmap("K", vim.lsp.buf.hover, "Hover Documentation")
    end

    -- 5. Configurar capacidades para autocompletado
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim-lsp").default_capabilities(capabilities)

    -- 6. Configurar servidores LSP individualmente

    -- Lua
    require("lspconfig").lua_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
            }
          },
          telemetry = { enable = false },
          diagnostics = {
            globals = { "vim" }
          }
        }
      }
    })

    -- Python (Pyright)
    require("lspconfig").pyright.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "basic",
            autoSearchPaths = true,
            useLibraryCodeForTypes = true
          }
        }
      }
    })

    -- C/C++ (clangd)
    require("lspconfig").clangd.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=never",
      },
    })

    -- Rust (rust-analyzer)
    require("lspconfig").rust_analyzer.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        ["rust-analyzer"] = {
          cargo = {
            allFeatures = true,
          },
          checkOnSave = {
            command = "clippy",
          },
        },
      },
    })

    -- 7. Configurar Fidget (notificaciones de estado de LSP)
    require("fidget").setup({
      text = {
        spinner = "dots",  -- Animación de carga
      },
      window = {
        blend = 0,         -- Transparencia
      },
    })
  end
}
