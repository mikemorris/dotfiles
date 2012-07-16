" Pathogen ******************************************************************
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

"config options
set nocompatible "dont run in Vi compatible mode
set guioptions-=T "hide toolbar
set guioptions-=L "hide left scrollbar
set guioptions-=r "hide right scrollbar
set sidescrolloff=2
set number "show line numbers
set numberwidth=4
set showcmd "show status line
set ruler "show ruler
"set nowrap
set linebreak "wrap at word
set cursorline "highlight cursor line
"set cursorcolumn "highlight cursor column

"syntax highlighting
syntax on

"colors and fonts
set t_Co=256 "256 colors

"use Mac clipboard
set clipboard=unnamed

"colorscheme functions
function! Theme_jellybeans()
  set background=dark 
  colorscheme jellybeans
  set guifont=Menlo:h15
endfunction

function! Theme_solarized()
  set background=light 
  colorscheme solarized
  set guifont=Menlo:h15
endfunction

call Theme_jellybeans()

"enable mouse reporting in iTerm
if has('mouse')
  set mouse=a
  if &term =~ "xterm" || &term =~ "screen"
    autocmd VimEnter * set ttymouse=xterm2
    autocmd FocusGained * set ttymouse=xterm2
    autocmd BufEnter * set ttymouse=xterm2
  endif
endif

"maximize screen and enter fullscreen mode
if has("gui_running")
  set transparency=4
  set fuoptions=maxvert,maxhorz
  au GUIEnter * set fullscreen
endif

"enable filetype plugin
filetype plugin on
filetype indent on

"search functionality
set hlsearch "highlight search
set incsearch "Incremental search, search as you type
set ignorecase "Ignore case when searching 
set smartcase "Ignore case when searching lowercase

"hide save prompt when switching away from a modified buffer
set hidden

"enable paste mode
imap <D-v> ^O:set paste<Enter>^R+^O:set nopaste<Enter>

" Tabs ************************************************************************
"set sta " a <Tab> in an indent inserts 'shiftwidth' spaces

function! Tabstyle_tabs()
  "using 4 column tabs
  set softtabstop=4
  set shiftwidth=4
  set tabstop=4
  set noexpandtab
  autocmd User Rails set softtabstop=4
  autocmd User Rails set shiftwidth=4
  autocmd User Rails set tabstop=4
  autocmd User Rails set noexpandtab
endfunction

function! Tabstyle_spaces()
  "using 2 spaces
  set softtabstop=2
  set shiftwidth=2
  set tabstop=2
  set expandtab
endfunction

call Tabstyle_spaces()

" Indenting *******************************************************************
set ai "automatically set the indent of a new line (local to buffer)
set si "smartindent (local to buffer)

" Windows *********************************************************************
set equalalways " Multiple windows, when created, are equal in size
set splitbelow splitright

" Vertical and horizontal split then hop to a new buffer
noremap <Leader>v :vsp^M^W^W<cr>
noremap <Leader>h :split^M^W^W<cr>

" Exuberant CTags ******************************************************************
set tags=/Dropbox/Sites/.tags " Set symlink in root to /Users/{username}/Dropbox for this to work

" Zen Coding ******************************************************************
let g:user_zen_leader_key = '<C-z>'

" Set Less *******************************************************************
au BufRead *.less set syntax=css

" Insert New Line *************************************************************
map <S-Enter> O<ESC> " awesome, inserts new line without going into insert mode
map <Enter> o<ESC>

" NERDTree ********************************************************************
:noremap <Leader>n :NERDTreeToggle /Dropbox/Sites<CR>
let NERDTreeHijackNetrw=1 " User instead of Netrw when doing an edit /foobar
let NERDTreeMouseMode=1 " Single click for everything

" SUPERCOMPLETE **************************************************************
let g:SuperTabDefaultCompletionType = "context"

" TAGBAR ********************************************************************
map <Leader>y :TagbarToggle<cr>

" AutoComplPop ********************************************************************
"let g:acp_behaviorSnipmateLength = 1

" Command-T ********************************************************************
map <Leader>f :CommandT<cr>

" Macros ********************************************************************
" fix quotation marks and mdashes form pasting MSWord text
function! Fix_MSWord()
  if search('“\|”')
    :%s/“\|”/"/g
  endif
  if search('’')
    :%s/’/'/g
  endif
  if search('–')
    :%s/–/\&mdash;/g
  endif
endfunction

let @w = ':call Fix_MSWord()'

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
