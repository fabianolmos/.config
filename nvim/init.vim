set title
set number
set autoindent
set relativenumber
set nowrap "No dividir la linea si es muy larga
set cursorline "Resalta linea actual

set hidden "Permite cambiar de buffers sin tener que guardarlos

set termguicolors "Activa true colors en la terminal
set background=light  " Fondo del tema: light o dark
colorscheme torte  " Nombre del tema

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

syntax on

" Filetype plugins enable
filetype plugin on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

"Plugin
"Ejecutar vim +PluginInstall +qall para instalar plugin de git
call vundle#begin()
Plugin 'https://github.com/kien/ctrlp.vim.git'
Plugin 'https://github.com/majutsushi/tagbar'
Plugin 'https://github.com/scrooloose/nerdcommenter.git'
Plugin 'hari-rangarajan/CCTree' 
Plugin 'vim-python/python-syntax'
Plugin 'preservim/nerdtree'
Plugin 'kdheepak/lazygit.nvim'
call vundle#end() " required

"Keyboard shortcut
let mapleader = "-"
nnoremap <leader>. :CtrlPTag<cr>
nnoremap -c ddO
nnoremap <leader>p :CtrlPMixed<cr>
cmap w!! w !sudo dd of=%<Enter>

" Check .hg/tags for ctags file.
fun! FindTagsFileInGitDir(file)
 let path = fnamemodify(a:file, ':p:h')
 while path != '/'
   let fname = path . '/.hg/tags'
   if filereadable(fname)
    silent! exec 'set tags+=' . fname
   endif
   let path = fnamemodify(path, ':h')
 endwhile
endfun
augroup CtagsGroup
 autocmd!
 autocmd BufRead * call FindTagsFileInGitDir(expand("<afile>"))
augroup END

"add folder to ctags
"let &tags=$CTAGS_DB
set tags=./tags;/home/fabian/hg;/home/fabian;
set tags=./.hg/tags;/home/fabian/hg
set tags+=/home/fabian/hg/jennic/.hg/tags
set tags+=/home/fabian/hg/oxycontroller/.git/tags
set tags+=/home/fabian/zephyrproject/zephyr/.git/tags
set tags+=/home/fabian/hg/microlib2/.hg/tags
set tags+=/home/fabian/hg/sensorlib/.hg/tags
set tags+=/home/fabian/catkin_ws/src/tags
set tags+=/home/fabian/hau-export/tags
"set tags+=/home/fabian/hg/jennic_oficial/.hg/tags
"set tags+=/home/fabian/hg/microlib_oficial/.hg/tags

" NerdCommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Cscope
"let &tags=$CTAGS_DB

" enable all Python syntax highlighting features
let python_highlight_all = 1

" TagBar settings
nmap  <F8> : TagbarToggle <CR>

" NerdTree settings
nmap <C-f> : NERDTreeToggle<CR>

" Shortcutting split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-q> <C-w>q

" Shortcut split opening
nnoremap <leader>h :split<Space>
nnoremap <leader>v :vsplit<Space>

" Shortcur Nerdtree
map <C-n> :NERDTreeToggle<CR>

nnoremap <leader>s :w<CR>  " Guardar con <líder> + s

" Usar <líder> + y para copiar al portapapeles
vnoremap <leader>y "+y
nnoremap <leader>y "+y

" Usar <líder> + d para cortar al portapapeles
vnoremap <leader>d "+d
nnoremap <leader>d "+d

" Usar <líder> + p para pegar desde el portapapeles
nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>P "+P

" Moverse al buffer siguiente con <líder> + l
nnoremap <leader>l :bnext<CR>

" Moverse al buffer anterior con <líder> + j
nnoremap <leader>j :bprevious<CR>

" Moverse al buffer siguiente con <líder> + k
nnoremap <leader>k :bpnext<CR>

" Cerrar el buffer actual con <líder> + q
nnoremap <leader>q :bdelete<CR>

" setup mapping to call :LazyGit
nnoremap <silent> <leader>gg :LazyGit<CR>
