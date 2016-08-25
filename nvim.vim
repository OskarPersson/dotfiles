" Map leader to ,
let mapleader = ","

" -------- Vundle -------
" set nocompatible              " be iMproved, required
" filetype off                  " required

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()

" ------- PLUG ------
call plug#begin('~/.config/nvim/plugged')

" let Vundle manage Vundle, required
Plug 'VundleVim/Vundle.vim'

Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'StanAngeloff/php.vim'
Plug 'bling/vim-airline'
Plug 'matze/vim-move'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/gitignore.vim'
Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'terryma/vim-multiple-cursors'
Plug 'evidens/vim-twig'
Plug 'tpope/vim-surround'
Plug 'othree/yajs.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'davinche/godown-vim'
Plug 'jwalton512/vim-blade'
Plug 'ntpeters/vim-better-whitespace'
Plug 'kchmck/vim-coffee-script'
Plug 'cakebaker/scss-syntax.vim'
Plug 'raichoo/smt-vim'
Plug 'benekastah/neomake'
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" Color schemes
Plug 'jnurmine/Zenburn'
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'

" Add plugins to &runtimepath
call plug#end()


" All of your Plugins must be added before the following line
" call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on           " required by LaTeX-Box

" -------- Misc ------------

" Use system clipboard
" set clipboard=unnamed
set clipboard+=unnamedplus

" Display line numbers
set number

" Dont wrap lines
set nowrap

" No swap file
set noswapfile

" Keep a backup file
set backup

" Backup dir
set backupdir=~/.config/nvim/backup//

" Highlight search matches
set hlsearch

" Case-insensitive saerch
set ignorecase

" Remove trailing whitespace in some filetypes
autocmd FileType c,cpp,java,php,tex,vimrc autocmd BufWritePre <buffer> :%s/\s\+$//e

" Fix colors?
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" ------- Indentation ------

" Convert tabs to spaces
set expandtab

" Keep indentation level from previous line
set autoindent

" Affect block indentatoin with >> and <<
set shiftwidth=4

" Length of soft tab in spaces
set softtabstop=4

" Tab width
set tabstop=4

" LaTeX indentation
let g:tex_flavor='latex'

" ------- Appearance ----------

" Color scheme
syntax enable
set background=dark
let base16colorspace=256
let g:gruvbox_italic=1
colorscheme gruvbox

" Highlight current line
set cursorline
hi CursorLineNr   term=bold ctermfg=Yellow gui=bold guifg=Yellow

" Always show statusline
set laststatus=2

" Hide right and left scrollbar
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" ------- Key Bindings ---------

" Save with <leader>w
nmap <leader>w :w<cr>

" Close with <leader>q
nmap <leader>q :q<cr>

" Horizontal split with <leader>s
nmap <leader>s <C-w>s

" Vertical split with <leader>v
nmap <leader>v <C-w>v

" Remove highlight with <leader>h
nmap <leader>h :noh<cr>

" Make backspace work like most other apps
set backspace=2

" Compile .tex with C-s
nnoremap <C-s> :w \| Latexmk <CR>

"Run FZF with C-f
map <C-F> :FZF<CR>

" Start of line, end of line - Emacs binding
nnoremap <silent> <C-a> ^
nnoremap <silent> <C-e> $
vnoremap <silent> <C-a> ^
vnoremap <silent> <C-e> $
inoremap <silent> <C-a> <esc>^i
inoremap <silent> <C-e> <esc>$i

"<C-k>   Move current line/selections up
"<C-j>   Move current line/selections down
let g:move_key_modifier = 'C'

" Resize pane with C-r + arrow key
noremap <C-r><up>  10<C-W>+
noremap <C-r><down>  10<C-W>-
noremap <C-r><left>  10<C-W><
noremap <C-r><right> 10<C-W>>

" Open next/previous buffer
noremap <C-i> :bnext<CR>

" NVim terminal pane navigation
tnoremap <Esc> <C-\><C-n>

" Open neomake list with C-l
map <C-L> :lopen<CR>

" ------- Plugin Settings ------

" Open NERDTree on Vim start-up
"autocmd vimenter * NERDTree

" Display hidden files in NERDTree
let NERDTreeShowHidden=1

" -------------------- NEOMAKE ------------------------
" Run on save
autocmd! BufWritePost *.py Neomake

" Run on open
au BufReadPost *.py Neomake

let g:neomake_c_enabled_makers = ['clang']
let g:neomake_c_clang_maker = {
    \ 'args': ['-Wall', '-Wextra', '-Werror', '-std=c99', '-x', 'c'],
    \ }

let g:neomake_php_enabled_makers = ['php', 'phpcs']
let g:neomake_php_phpcs_args_standard = 'PSR2'

let g:neomake_scss_enabled_makers = ['scsslint']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_python_enabled_makers = ['flake8']
" -----------------------------------------------------

" Enable deoplete at start up
let g:deoplete#enable_at_startup = 1

" Airline glyphs
let g:airline_powerline_fonts = 1

" Fix airline bleeding over
let airline#extensions#default#section_use_groupitems = 0

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
