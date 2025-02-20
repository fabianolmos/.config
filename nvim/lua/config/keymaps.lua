local keymap = vim.keymap.set

-- Atajos generales
keymap("n", "<leader>sv", "<cmd>source $MYVIMRC<cr>", { desc = "Recargar configuración" })

-- Navegación entre splits
keymap("n", "<C-h>", "<C-w>h", { desc = "Moverse al split izquierdo" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Moverse al split inferior" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Moverse al split superior" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Moverse al split derecho" })
keymap("n", "<C-q>", "<C-w>q", { desc = "Cerrar split actual" })

-- Creación de splits
keymap("n", "<leader>h", ":split<Space>", { desc = "Crear split horizontal" })
keymap("n", "<leader>v", ":vsplit<Space>", { desc = "Crear split vertical" })

-- Navegación entre buffers
keymap("n", "<leader>l", ":bnext<CR>", { desc = "Siguiente buffer" })
keymap("n", "<leader>j", ":bprevious<CR>", { desc = "Buffer anterior" })
keymap("n", "<leader>q", ":bdelete<CR>", { desc = "Cerrar buffer actual" })

-- Copiar y pegar desde el portapapeles
keymap("v", "<leader>y", '"+y', { desc = "Copiar al portapapeles" })
keymap("n", "<leader>y", '"+y', { desc = "Copiar al portapapeles" })
keymap("v", "<leader>d", '"+d', { desc = "Cortar al portapapeles" })
keymap("n", "<leader>d", '"+d', { desc = "Cortar al portapapeles" })
keymap("n", "<leader>p", '"+p', { desc = "Pegar desde el portapapeles" })
keymap("v", "<leader>p", '"+p', { desc = "Pegar desde el portapapeles" })
keymap("n", "<leader>P", '"+P', { desc = "Pegar antes desde el portapapeles" })
keymap("v", "<leader>P", '"+P', { desc = "Pegar antes desde el portapapeles" })

-- Telescope (búsquedas)
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Buscar archivos" })
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Buscar texto" })
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buscar buffers" })
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Buscar ayuda" })
keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Buscar archivos recientes" })
keymap("n", "<leader>fc", "<cmd>Telescope git_commits<cr>", { desc = "Buscar commits" })
keymap("n", "<leader>fs", "<cmd>Telescope git_status<cr>", { desc = "Buscar estado de Git" })

-- LSP (Language Server Protocol)
keymap("n", "gd", vim.lsp.buf.definition, { desc = "Ir a la definición" })
keymap("n", "gr", vim.lsp.buf.references, { desc = "Ver referencias" })
keymap("n", "K", vim.lsp.buf.hover, { desc = "Mostrar documentación" })
keymap("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Renombrar símbolo" })
keymap("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Acciones de código" })
keymap("n", "<leader>fd", vim.diagnostic.open_float, { desc = "Ver diagnóstico" })

-- Git
keymap("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Abrir LazyGit" })
keymap("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "Estado de Git" })
keymap("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Commits de Git" })

-- Misceláneos
keymap("n", "<leader>c", "<cmd>CommentToggle<cr>", { desc = "Comentar/descomentar" })
keymap("n", "<leader>tt", "<cmd>TagbarToggle<cr>", { desc = "Abrir/cerrar Tagbar" })
keymap("n", "<leader>nn", "<cmd>NERDTreeToggle<cr>", { desc = "Abrir/cerrar NERDTree" })
keymap("n", "<leader>ss", "<cmd>SymbolsOutline<cr>", { desc = "Abrir/cerrar símbolos" })

-- Formateo
keymap("n", "<leader>fm", "<cmd>lua vim.lsp.buf.format()<cr>", { desc = "Formatear buffer" })

-- Limpiar búsqueda
keymap("n", "<esc><esc>", "<cmd>nohlsearch<cr>", { desc = "Limpiar búsqueda" })

-- Guardar archivo
keymap("n", "<leader>w", "<cmd>w<cr>", { desc = "Guardar archivo" })

-- Forzar guardar con sudo
keymap("n", "<leader>W", "<cmd>w !sudo tee %<cr>", { desc = "Guardar con sudo" })

-- Keymaps adicionales sugeridos
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Abrir/cerrar NvimTree" })
keymap("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Cerrar buffer actual" })
keymap("n", "<leader>ba", "<cmd>%bd|e#<cr>", { desc = "Cerrar todos los buffers excepto el actual" })
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Buscar archivos" })
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Buscar texto" })
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buscar buffers" })
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Buscar ayuda" })
keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Buscar archivos recientes" })
keymap("n", "<leader>fc", "<cmd>Telescope git_commits<cr>", { desc = "Buscar commits" })
keymap("n", "<leader>fs", "<cmd>Telescope git_status<cr>", { desc = "Buscar estado de Git" })
