set encoding=utf-8
set shellslash
set guiheadroom=0

set packpath+=~/.vim
set runtimepath+=~/.vim,~/.vim/after 

if has('win32')
    set guifont=DejaVu_Sans_Mono_for_Powerline:h10:cANSI
endif

" Allow for OpenGL 'gl' auto triggers
"let g:ycm_semantic_triggers =  { 'cpp,objcpp' : ['->', '.', '::', 're!gl'] }
let g:ycm_confirm_extra_conf=0


filetype plugin indent on

" Always use unix-style line endings
set ff=unix

" Default Indents
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

if has('autocmd')
  " Maximize GVim on startup (Windows)
  if has('win32') && has('gui_running')
    au GUIEnter * simalt ~x
  endif

  " File-specific indents
  au FileType cpp setlocal ts=4 sts=4 sw=4 expandtab
  au FileType html setlocal foldmethod=manual
  " Add Maya python library when editing python files
  au FileType python let $PYTHONPATH .= ';' .
  \'usr/autodesk/maya2013-x64/devkit/other/pymel/extras/completion/py'
  au FileType python set comments=sl:''',mb:#,ex:''',:#

  " File type assignment
  au BufRead,BufNewFile *.vfl set filetype=vex
  au BufRead,BufNewFile *.cpg set filetype=cpp | SyntasticToggleMode
endif

set wrap

syntax on
set foldmethod=syntax
" Fold focus around a single fold
nnoremap zs zMzv

let mapleader=','

" Remove gui options for gvim
set guioptions-=m "GUI menu
set guioptions-=T "GUI toolbar
set guioptions-=r
set guioptions-=L
set guioptions-=e "Tab line
set guioptions-=b

"------------------------------------------------------------------------------
" TAB CONTROLS
"------------------------------------------------------------------------------

" Always display tabs
set showtabline=2
nnoremap tl :tabnext<CR>
nnoremap th :tabprevious<CR>
nnoremap tn :tabnew<CR>
nnoremap tc :tabclose<CR>

" Taglist options
let Tlist_Use_Left_Window=1
let Tlist_Auto_Open=0
let Tlist_Enable_Fold_Column=0
let Tlist_Compact_Format=0
let Tlist_WinWidth=32
let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close = 1
nmap <Leader><Leader>t :Tlist<cr>

set backup
" Put swap files in the system's temporary directory
if has('win32')
  set backupdir=$TEMP
  set directory=$TEMP
else
  set backupdir=~/.backup
  set directory=~/.tmp
endif

if has('unix')
    set clipboard+=unnamedplus
endif

" Don't indent class scope declarations
set cino+=g0
" Align parentheses
set cino+=(0
" Remove indent for namespaces
set cino+=N-s

" Enable search highlighting
set hlsearch
" Clear search query
"nnoremap <silent> <Leader><Leader>c :let @/ = ''<CR>

" Configure basic theme settings
set t_Co=256
colorscheme molokai
" Font setup
if has('win32')
  "set guifont=Consolas:h11:cANSI
else
  "set guifont=Inconsolata\ 11
endif
" Horizontal column
if version >= 703
  set colorcolumn=80
endif
hi ColorColumn ctermbg=234
" A more useful matching parenthesis highlighting
hi MatchParen cterm=none ctermbg=none ctermfg=166
" Remove the startup text
set shortmess+=I

nnoremap <silent> <F2> :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" Display a number of lines below or above the current line
set scrolloff=5

set textwidth=80

" Automatically read a file that has changed on disk
set autoread

" Hide search highlighting temporarily
nnoremap <CR> :noh<CR><CR>

" -----------------------------------------------------------------------------
" WINDOWS
" -----------------------------------------------------------------------------

" Move between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
vnoremap <C-h> <Esc><C-w>hv
vnoremap <C-k> <Esc><C-w>kv
vnoremap <C-l> <Esc><C-w>lv
" Move windows
nnoremap <C-w>h <C-w><S-h>
nnoremap <C-w>j <C-w><S-j>
nnoremap <C-w>k <C-w><S-k>
nnoremap <C-w>l <C-w><S-l>
vnoremap <C-w>h <Esc><C-w><S-h>v
vnoremap <C-w>j <Esc><C-w><S-j>v
vnoremap <C-w>k <Esc><C-w><S-k>v
vnoremap <C-w>l <Esc><C-w><S-l>v

" Open the current buffer in a new tab; <C-w>c to close it off
nnoremap <C-w>o :tab sp<CR>

" -----------------------------------------------------------------------------
" INSERT MODE EDITING
" -----------------------------------------------------------------------------

" Insert movement
imap <C-h> <C-o>I
imap <C-j> <C-o>o
imap <C-k> <C-o>O
imap <C-l> <C-o>A

" Delete
inoremap <C-D> <Del>

" Allow switching between buffers without saving
set hidden

" Improved command-line tab completion
set wildmenu

" Always display the status line
set laststatus=2

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" Remove separator characters
set fillchars=""

" Paste toggle for preserving indentations
set pastetoggle=<F3>

" Line numbers
if version == 703
  set relativenumber
  " Toggle relative numbers
  nnoremap <silent> <F4> :exec &nu == 0 ? 'set nu!' : 'set rnu!'<CR>
elseif version >= 704
  " Use the new hybrid line number mode
  set number
  set relativenumber
else
  set number
endif

" Insert empty lines before and after without going into insert mode
nnoremap <A-k> :normal O<CR>j
nnoremap <A-j> :normal o<CR>k

if version >= 703
  set conceallevel=2
  set concealcursor=vin
endif

" -----------------------------------------------------------------------------
" SYNTASTIC
" -----------------------------------------------------------------------------

if has('win32')
  let g:syntastic_error_symbol='×'
  let g:syntastic_warning_symbol='‼'
else
  let g:syntastic_error_symbol='✗'
  let g:syntastic_warning_symbol='⚠'
endif
let g:syntastic_cpp_compiler='clang++'
let g:syntastic_cpp_config_file='.clang_complete'
let g:syntastic_cpp_check_header=1
 
" -----------------------------------------------------------------------------
" ULTISNIPS
" -----------------------------------------------------------------------------
" UltiSnips mappings
let g:UltiSnipsExpandTrigger='<C-f>'
let g:UltiSnipsJumpForwardTrigger='<C-f>'
let g:UltiSnipsJumpBackwardTrigger='<C-b>'
let g:UltiSnipsSnippetDirectories=['../../../../snippets/UltiSnips']
map <Leader><Leader>s <Esc>:call UltiSnips_ListSnippets()<CR>

" -----------------------------------------------------------------------------
" PYTHON-MODE
" -----------------------------------------------------------------------------

let g:pymode_rope=0
let g:pymode_lint_write=0

" -----------------------------------------------------------------------------
" JEDI-VIM
" -----------------------------------------------------------------------------

let g:jedi#popup_on_dot=0

" -----------------------------------------------------------------------------
" VIM-SESSION
" -----------------------------------------------------------------------------

let g:session_directory='~/.sessions'
let g:session_autosave = 'no'

" -----------------------------------------------------------------------------
" VIM-AIRLINE
" -----------------------------------------------------------------------------

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.paste = 'ρ'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" -----------------------------------------------------------------------------
" CLANG_COMPLETE
" -----------------------------------------------------------------------------

"set completeopt=menu,menuone
"if has('win32')
  "let g:clang_library_path='C:\lib\libclang'
"endif
"let g:clang_sort_algo='alpha'
"let g:clang_use_library=1
"let g:clang_complete_copen=1
"let g:clang_complete_macros=1
"let g:clang_complete_patterns=0
"let g:clang_complete_auto=0
"let g:clang_close_preview=1
"imap <C-Space> <C-x><C-u>
"imap <C-@> <C-Space>
"let g:clang_snippets=1
"let g:clang_snippets_engine='ultisnips'

"------------------------------------------------------------------------------
" OLD TAB CONTROLS
"------------------------------------------------------------------------------

" Display tab numbers in gvim
"set guitablabel=%N:%M%t
" Modify the tab label for vim
"set tabline=%!TabLine()

" Status Line
"set statusline=                                     "Initialize
"set statusline+=\ [%n]                              "Buffer Number
"set statusline+=%t                                  "Filename Tail
"set statusline+=%m                                  "Modified Flag
"set statusline+=\ %y                                "File Type
"set statusline+=\ [%{''.(&fenc!=''?&fenc:&enc).''}] "Encoding
"set statusline+=%=                                  "Right Align
"set statusline+=[Row:\ %l/%L\ (%p%%),               "Row/Total Rows (%)
"set statusline+=\ Col:\ %c]\                        "Column
