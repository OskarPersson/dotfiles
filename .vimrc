" Map leader to ,
let mapleader = ","



" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')


" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run install script
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Install gruvbox color scheme:
Plug 'ellisonleao/gruvbox.nvim'

" tmux style zoom
Plug 'dhruvasagar/vim-zoom'

" Asynchronous Linting
"Plug 'w0rp/ale'
"let g:ale_disable_lsp = 1

" Multi-Cursor
Plug 'mg979/vim-visual-multi'

" Syntax highlighting and indentation
" Disable csv
let g:polyglot_disabled = ['csv']
Plug 'sheerun/vim-polyglot'

" Editorconfig
Plug 'editorconfig/editorconfig-vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'shumphrey/fugitive-gitlab.vim'

" Tagbar
Plug 'majutsushi/tagbar'

" Rust
Plug 'rust-lang/rust.vim'

" Golang
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" C# / .NET
Plug 'OmniSharp/omnisharp-vim'

" Intellisense (ish)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" NERDTree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" continuously updated session files
Plug 'tpope/vim-obsession'

" Add syntax highlight to generic log files
Plug 'mtdl9/vim-log-highlighting'

Plug 'leafOfTree/vim-svelte-plugin'

tnoremap <Esc> <C-\><C-n>

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

Plug 'rbong/vim-crystalline'

" Initialize plugin system
call plug#end()

" Do not automatically wrap on load
set nowrap
set textwidth=0
set wrapmargin=0

" Do not automatically wrap text when typing
set formatoptions-=t

" Use system clipboard
" https://stackoverflow.com/questions/30691466/what-is-difference-between-vims-clipboard-unnamed-and-unnamedplus-settings
set clipboard^=unnamed,unnamedplus

" https://github.com/zeit/hyper/issues/786
if $TMUX == ''
    set clipboard+=unnamed
endif

" Disable swap files
set noswapfile

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

" Mouse mode
set mouse=a

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
map <C-F> :Files<CR>
map <C-T> :BLines<CR>

" Use bottom split for fzf
let g:fzf_layout = { 'down': '40%' }

" Run Ripgrep with C-S
nmap <C-S> :Rg<CR>
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

" Set update time of gitgutter to 300ms
set updatetime=300

" Set .tsx and .jsx filetypes as typescript.jsx
" autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.jsx

" Enable typescript syntax in svelte
let g:vim_svelte_plugin_use_typescript = 1

" Rust
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

" Crystalline
function! StatusLine(current, width)
  let l:s = ''

  if a:current
    let l:s .= crystalline#mode() . crystalline#right_mode_sep('')
  else
    let l:s .= '%#CrystallineInactive#'
  endif
  let l:s .= ' %f%h%w%m%r '
  if a:current
    let l:s .= crystalline#right_sep('', 'Fill') . ' %{FugitiveHead()}'
  endif

  let l:s .= ' %{coc#status()}%{get(b:,"coc_current_function","")}'
  "let l:s .= ' %{LinterStatus()}'

  let l:s .= '%='
  if a:current
    let l:s .= crystalline#left_sep('', 'Fill') . ' %{&paste ?"PASTE ":""}%{&spell?"SPELL ":""}'
    let l:s .= crystalline#left_mode_sep('')
  endif
  if a:width > 80
    let l:s .= ' %{&ft}[%{&enc}][%{&ffs}] %l/%L %c%V %P '
  else
    let l:s .= ' '
  endif

  return l:s
endfunction

function! TabLine()
  let l:vimlabel = has('nvim') ?  ' NVIM ' : ' VIM '
  return crystalline#bufferline(2, len(l:vimlabel), 1) . '%=%#CrystallineTab# ' . l:vimlabel
endfunction

let g:crystalline_enable_sep = 1
let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_tabline_fn = 'TabLine'
let g:crystalline_theme = 'gruvbox'

set showtabline=0
set guioptions-=e
set laststatus=2

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

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" COC

let g:coc_global_extensions = [
      \'coc-prettier',
      \'coc-eslint',
      \'coc-tsserver',
      \'coc-go',
      \'coc-svelte',
      \'coc-rust-analyzer',
      \'coc-pyright',
      \'coc-json',
      \]

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> ga <Plug>(coc-codeaction-cursor)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> go <Cmd>CocCommand rust-analyzer.openDocs<CR>
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>



" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes
