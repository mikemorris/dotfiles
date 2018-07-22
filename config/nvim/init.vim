call plug#begin('~/.local/share/nvim/plugged')

" Colorschemes
Plug 'flazz/vim-colorschemes'

" Syntax
Plug 'hail2u/vim-css3-syntax'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'HerringtonDarkholme/yats.vim' " TypeScript
Plug 'elixir-editors/vim-elixir'

" Lint
Plug 'w0rp/ale'
Plug 'slashmili/alchemist.vim' " Elixir
" Plug 'neomake/neomake'

" Autocomplete
Plug 'tpope/vim-surround'

if has('nvim')
  " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  " Plug 'Shougo/deoplete.nvim'
  " Plug 'roxma/nvim-yarp'
  " Plug 'roxma/vim-hug-neovim-rpc'
endif
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm i -g tern' } " JavaScript

" Edit
Plug 'vim-scripts/sudo.vim'
Plug 'tpope/vim-commentary'
" Plug 'editorconfig/editorconfig-vim'

" Search
Plug 'mileszs/ack.vim' " Search in files
Plug 'ctrlpvim/ctrlp.vim' " Fuzzy file finder

" Test
" Plug 'janko-m/vim-test'

" git
" Plug 'tpope/fugitive.vim'

" tmux
" Plug 'christoomey/vim-tmux-navigator'

call plug#end()

" NeoVim sets these by default
set nocompatible " Don't run in Vi compatible mode
set showcmd " Show status line
set ruler " Show ruler

set cursorline " Highlight cursor line

" vim-plug sets these by default
" filetype plugin indent on
" syntax on

" Use Mac clipboard
set clipboard=unnamed

" Enable mouse reporting
set mouse=a

" Leader
let mapleader = ','

" Alignment
set tabstop=4 softtabstop=2 shiftwidth=2 expandtab smarttab ai si
set wrap linebreak " Wrap lines at word
set number " Show line numbers

" Colorschemes
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_visibility="high"
let g:solarized_contrast="high"
colorscheme solarized

" Syntax
let g:javascript_plugin_jsdoc = 1

" Lint
let g:ale_linters = {
\  'javascript': ['flow']
\}
highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_sign_error = 'X'
let g:ale_sign_warning = '?'
let g:ale_statusline_format = ['X %d', '? %d', '']
" %linter% is the name of the linter that provided the message
" %s is the error or warning message
let g:ale_echo_msg_format = '%linter% says %s'
" Map keys to navigate between lines with errors and warnings.
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>

" Autocomplete
let g:deoplete#enable_at_startup = 1

" Search
set incsearch " Incremental search (as you type)
set smartcase " Ignore case when searching lowercase

nnoremap <leader>a :Ack 

" Add ag support to ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

let g:ctrlp_map = '<leader>p'

" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Window management
set splitbelow splitright
