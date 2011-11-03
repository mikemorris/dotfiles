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

"colors and fonts
"set t_Co=256 "256 colors
set background=dark 
set transparency=5
syntax on "syntax highlighting
colorscheme jellybeans
set guifont=Menlo:h16

"maximize screen and enter fullscreen mode
if has("gui_running")
  set fuoptions=maxvert,maxhorz
  au GUIEnter * set fullscreen
endif

"enable filetype plugin
filetype plugin on
filetype indent on

"set jj to escape for mode switching
let mapleader = ","
imap jj <Esc> 

"search functionality
set hlsearch  " highlight search
set incsearch  " Incremental search, search as you type
set ignorecase " Ignore case when searching 
set smartcase " Ignore case when searching lowercase

"hide save prompt when switching away from a modified buffer
set hidden

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
set tags=/Users/mikemorris/Sites/tags

" Zen Coding ******************************************************************
let g:user_zen_leader_key = '<D-e>'

" Set Less *******************************************************************
au BufRead *.less set syntax=css

" Insert New Line *************************************************************
map <S-Enter> O<ESC> " awesome, inserts new line without going into insert mode
map <Enter> o<ESC>

" NERDTree ********************************************************************
:noremap <Leader>n :NERDTreeToggle Sites<CR>
let NERDTreeHijackNetrw=1 " User instead of Netrw when doing an edit /foobar
let NERDTreeMouseMode=1 " Single click for everything

" SUPERCOMPLETE **************************************************************
let g:SuperTabDefaultCompletionType = "context"

" TAGBAR ********************************************************************
map <Leader>y :TagbarToggle<cr>

" AutoComplPop ********************************************************************
let g:acp_behaviorSnipmateLength = 1

" Command-T ********************************************************************
map <Leader>f :CommandT<cr>
