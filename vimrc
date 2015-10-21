" Map leader to ,
let mapleader = ","

" -------- Vundle -------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'StanAngeloff/php.vim'
Plugin 'bling/vim-airline'
Plugin 'matze/vim-move'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/syntastic'
Plugin 'danchoi/vitunes'
Plugin 'vim-scripts/gitignore.vim'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'evidens/vim-twig'

" Color schemes
Plugin 'jnurmine/Zenburn'
Plugin 'chriskempson/base16-vim'
Plugin 'morhetz/gruvbox'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on           " required by LaTeX-Box

" -------- Misc ------------

" Display line numbers
set number

" Dont wrap lines
set nowrap

" Highlight search matches
set hlsearch

" Case-insensitive saerch
set ignorecase

" Remove trailing whitespace in some filetypes
autocmd FileType c,cpp,java,php,tex,vimrc autocmd BufWritePre <buffer> :%s/\s\+$//e

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

" ------- Appearance ----------

" Color scheme
syntax enable
set background=dark
let base16colorspace=256
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

" Make backspace work like most other apps
set backspace=2

" Compile .tex with C-t
nnoremap <C-t> :w \| Latexmk <CR>

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


" ------- Plugin Settings ------

" Open NERDTree on Vim start-up
"autocmd vimenter * NERDTree

" Display hidden files in NERDTree
let NERDTreeShowHidden=1

" Display hidden files in CtrlP results
let g:ctrlp_show_hidden = 1

" Have CtrlP ignore some directories
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor,*/bower_components,*/node_modules

" Recommended settings for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" Syntastic should use PSR-2 for PHP
let g:syntastic_php_phpcs_args="--standard=PSR2 -n"

" Disable Syntastic for .tex, .twig files
let g:syntastic_mode_map = { 'passive_filetypes': ['tex', 'twig'] }

" Allow 'plain text' in <head> elements (for twig files)
let g:syntastic_html_tidy_ignore_errors = [ "plain text isn't allowed in <head> elements" ]

" Airline glyphs
let g:airline_powerline_fonts = 1
