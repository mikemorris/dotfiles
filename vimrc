"config options
set nocompatible "dont run in Vi compatible mode
set guioptions-=T "hide toolbar
set guioptions-=L "hide left scrollbar
set guioptions-=r "hide right scrollbar
set sidescrolloff=2
set showcmd "show status line
set ruler "show ruler
set cursorline "highlight cursor line
"set cursorcolumn "highlight cursor column

function! Theme_solarized()
  set background=light 
  colorscheme solarized
  set guifont=Menlo:h13
endfunction

"maximize screen and enter fullscreen mode
if has("gui_running")
  set transparency=4
  set fuoptions=maxvert,maxhorz
  au GUIEnter * set fullscreen
endif

"search functionality
set hlsearch "highlight search
set incsearch "Incremental search, search as you type
set ignorecase "Ignore case when searching 
set smartcase "Ignore case when searching lowercase

"hide save prompt when switching away from a modified buffer
set hidden

"enable paste mode
imap <D-v> ^O:set paste<Enter>^R+^O:set nopaste<Enter>

function! Tabstyle_tabs()
  autocmd User Rails set noexpandtab
endfunction

" Indenting *******************************************************************
set ai "automatically set the indent of a new line (local to buffer)
set si "smartindent (local to buffer)

" Leader
let mapleader = ','

" Vertical and horizontal split then hop to a new buffer
noremap <Leader>v :vsp^M^W^W<cr>
noremap <Leader>h :split^M^W^W<cr>

" Set Less *******************************************************************
au BufRead *.less set syntax=css
au BufRead *._ set syntax=html
au BufRead *.glsl set syntax=c

" Insert New Line *************************************************************
map <S-Enter> O<ESC> " awesome, inserts new line without going into insert mode
map <Enter> o<ESC>

" Ag
nnoremap <leader>a :Ack 
let g:ackprg = 'ag --nogroup --nocolor --column'
