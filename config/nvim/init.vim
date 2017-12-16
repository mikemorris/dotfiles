call plug#begin('~/.local/share/nvim/plugged')

" Plug 'neomake/neomake'
Plug 'janko-m/vim-test'
Plug 'tpope/vim-surround'

Plug 'flazz/vim-colorschemes'
Plug 'HerringtonDarkholme/yats.vim'

Plug 'w0rp/ale'
Plug 'elixir-editors/vim-elixir'
Plug 'elmcast/elm-vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'mhartington/nvim-typescript'
Plug 'zchee/deoplete-jedi'

call plug#end()

set clipboard=unnamed
set mouse=a

set tabstop=4 softtabstop=2 shiftwidth=2 expandtab smarttab
set wrap linebreak
set number 

set t_Co=256
set background=dark

let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_visibility="high"
let g:solarized_contrast="high"
colorscheme solarized

let g:elm_format_autosave = 1
let g:deoplete#enable_at_startup = 1
