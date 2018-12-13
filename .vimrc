" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')


" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run install script
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Install gruvbox color scheme:
Plug 'alfunx/gruvbox'

" Asynchronous Linting
Plug 'w0rp/ale'

" Improved JavaScript syntax highlight and indentation
Plug 'pangloss/vim-javascript'
"
" Improved TypeScript syntax highlight and indentation
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" JSX syntax highlight
Plug 'mxw/vim-jsx'

" Editorconfig
Plug 'editorconfig/editorconfig-vim'

" Multiple cursors
Plug 'mg979/vim-visual-multi'

" Vim plugin for live markdown preview
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

" Misc
Plug 'airblade/vim-gitgutter'

Plug 'vim-airline/vim-airline'

" Initialize plugin system
call plug#end()

" Map leader to ,
let mapleader = ","

" Use system clipboard
" https://stackoverflow.com/questions/30691466/what-is-difference-between-vims-clipboard-unnamed-and-unnamedplus-settings
set clipboard^=unnamed,unnamedplus

" https://github.com/zeit/hyper/issues/786
if $TMUX == ''
    set clipboard+=unnamed
endif


" Load plugins and indentations files
" https://vi.stackexchange.com/a/10125/4722
filetype plugin indent on

" Color scheme
syntax enable
colorscheme gruvbox
set background=dark
let g:gruvbox_italic=1
"if has("termguicolors")
"  set termguicolors
"endif
let &t_ut=''

" Make backspace work like most other apps
set backspace=2

" Show line numbers
set number

" Smart-case search
set ignorecase
set smartcase

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

" --------------------------

" Save with <leader>w
nmap <leader>w :w<cr>


" Run FZF with C-f
map <C-F> :FZF<CR>

" Set update time of gitgutter to 100ms
set updatetime=100

" Set .tsx and .jsx filetypes as typescript.jsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.jsx

""" ALE
" Wait 500ms after text is changed before linting
let g:ale_lint_delay = 500

" Enable completion where available.
let g:ale_completion_enabled = 1

" Message format
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" Linters
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tslint'],
\   'python': ['flake8', 'pylint'],
\}

" Fixers
let g:ale_fixers = {
\   '*': ['remove_trailing_lines'],
\   'javascript': ['eslint'],
\   'typescript': ['tslint'],
\   'python': ['autopep8', 'isort', 'yapf'],
\}

""" Airline
if !exists('g:airline_symbols')
    let g:airline_symbols={}
endif

""" Unicode symbols
let g:airline_left_alt_sep='»'
let g:airline_left_sep='▶'
let g:airline_right_alt_sep='«'
let g:airline_right_sep='◀'
let g:airline_symbols.crypt='🔒'
let g:airline_symbols.linenr='☰'
let g:airline_symbols.linenr='␊'
let g:airline_symbols.linenr='␤'
let g:airline_symbols.linenr='¶'
let g:airline_symbols.maxlinenr='␤'
let g:airline_symbols.branch='⎇'
let g:airline_symbols.paste='ρ'
let g:airline_symbols.paste='Þ'
let g:airline_symbols.paste='∥'
let g:airline_symbols.spell='Ꞩ'
let g:airline_symbols.notexists='∄'
let g:airline_symbols.whitespace='Ξ'

""" Powerline    
let g:airline_left_sep=''
let g:airline_left_alt_sep=''
let g:airline_right_sep=''
let g:airline_right_alt_sep=''

" """ Straight ▌ │ ▐ │ or ▌ ▏ ▐ ▕
" let g:airline_left_sep='▌'
" let g:airline_left_alt_sep='│'
" let g:airline_right_sep='▐'
" let g:airline_right_alt_sep='│'

""" Powerline symbols
let g:airline_symbols.branch=''
let g:airline_symbols.readonly=''
let g:airline_symbols.linenr='☰'
let g:airline_symbols.maxlinenr=''

""" Airline settings
let g:airline_theme='gruvbox'
let g:airline#extensions#whitespace#mixed_indent_algo=1
let g:airline_powerline_fonts=1
let g:airline_skip_empty_sections=0
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_idx_mode=1
let g:airline#extensions#tabline#tab_nr_type=1
let g:airline#extensions#tabline#show_tab_nr=0
let g:airline#extensions#tabline#show_close_button=0
let g:airline#extensions#tabline#exclude_preview=1
let g:airline#extensions#tabline#fnamecollapse=1
let g:airline#extensions#tabline#fnamemod=':~:.'
let g:airline#extensions#tabline#buffers_label='buffers'
let g:airline#extensions#tabline#tabs_label='tabs'
let g:airline#extensions#tabline#overflow_marker='…'
let g:airline_section_z='%3p%% %3l:%-2v'

" let g:airline_mode_map = {
"             \ '__' : ' - ',
"             \ 'n'  : ' N ',
"             \ 'i'  : ' I ',
"             \ 'R'  : ' R ',
"             \ 'c'  : ' C ',
"             \ 'v'  : ' V ',
"             \ 'V'  : 'V-L',
"             \ '' : 'V-B',
"             \ 's'  : ' S ',
"             \ 'S'  : ' S ',
"             \ '' : ' S ',
"             \ }

""" Airline extensions
let g:airline#extensions#ale#error_symbol=''
let g:airline#extensions#ale#warning_symbol=''
let g:airline#extensions#ale#show_line_numbers=0
let g:airline#extensions#whitespace#show_message=1
let g:airline#extensions#hunks#enabled=0

"" GitGutter
nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterUndoHunk
nmap ]c <Plug>GitGutterNextHunk
nmap [c <Plug>GitGutterPrevHunk

let g:gitgutter_sign_added='┃'
let g:gitgutter_sign_modified='┃'
let g:gitgutter_sign_removed='◢'
let g:gitgutter_sign_removed_first_line='◥'
let g:gitgutter_sign_modified_removed='◢'


" Airline
" Airline glyphs
let g:airline_powerline_fonts = 1

" Fix airline bleeding over
let airline#extensions#default#section_use_groupitems = 0

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
