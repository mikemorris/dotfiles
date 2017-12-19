call plug#begin('~/.local/share/nvim/plugged')

" Colorschemes
Plug 'flazz/vim-colorschemes'

" Syntax
Plug 'hail2u/vim-css3-syntax'
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
Plug 'HerringtonDarkholme/yats.vim' " TypeScript
Plug 'elmcast/elm-vim'
Plug 'elixir-editors/vim-elixir'

" Autocomplete
if has('nvim')
  " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  " Plug 'Shougo/deoplete.nvim'
  " Plug 'roxma/nvim-yarp'
  " Plug 'roxma/vim-hug-neovim-rpc'
endif
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
" Plug 'zchee/deoplete-jedi' " Python
Plug 'tpope/vim-surround'

" Lint
Plug 'w0rp/ale'
Plug 'slashmili/alchemist.vim'
" Plug 'neomake/neomake'

" Edit
Plug 'bling/vim-airline'
" Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/sudo.vim'

" Search
Plug 'mileszs/ack.vim'

" Test
" Plug 'janko-m/vim-test'

" git
" Plug 'tpope/fugitive.vim'

" tmux
" Plug 'christoomey/vim-tmux-navigator'

call plug#end()

" vim-plug sets these automatically
" filetype plugin indent on
" syntax on

" Use Mac clipboard
set clipboard=unnamed

" Enable mouse reporting
set mouse=a

set tabstop=4 softtabstop=2 shiftwidth=2 expandtab smarttab
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
" let g:elm_format_autosave = 1

" Autocomplete
let g:deoplete#enable_at_startup = 1

" Search


" Add ag support to ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Window management
set splitbelow splitright
