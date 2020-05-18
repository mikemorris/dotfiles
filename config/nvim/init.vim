" Automatically install vim-plug if not present
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

" Colorschemes
Plug 'flazz/vim-colorschemes'
Plug 'ajmwagar/vim-deus'

" Syntax
Plug 'hail2u/vim-css3-syntax'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'HerringtonDarkholme/yats.vim' " TypeScript
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'elixir-editors/vim-elixir'

" Lint
Plug 'w0rp/ale'
" Plug 'slashmili/alchemist.vim' " Elixir

" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'

" This setting must be set before ALE is loaded.
" You should not turn this setting on if you wish to use ALE as a completion
" source for other completion plugins, like Deoplete.
" let g:ale_completion_enabled = 1

" Status Line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Edit
Plug 'vim-scripts/sudo.vim'
Plug 'tpope/vim-commentary'
" Plug 'editorconfig/editorconfig-vim'

" Search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Test
" Plug 'janko-m/vim-test'
" Plug 'sebdah/vim-delve' " Debug Go applications using Delve

" git
Plug 'tpope/vim-fugitive'

" tmux
Plug 'christoomey/vim-tmux-navigator'

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

" Window management
set splitbelow splitright

" Colorschemes
set t_Co=256
set background=dark
" set termguicolors " Leave disabled for Terminal.app
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme deus

" Set transparent background
" hi Normal guibg=NONE ctermbg=NONE

" Syntax
" Fastlane syntax highlighting
au BufNewFile,BufRead Fastfile,Appfile,Snapfile,Scanfile,Gymfile,Matchfile,Deliverfile set filetype=ruby

" TypeScript .tsx support
au BufNewFile,BufRead *.tsx set filetype=typescript

" jsonc comment highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+

" Lint
let g:ale_linters = {
\ 'go': ['gopls', 'golangci_lint'],
\}

let g:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ 'javascript': ['prettier'],
\ 'json': ['prettier'],
\ 'css': ['prettier'],
\ 'markdown': ['prettier'],
\ 'rust': ['rustfmt'],
\ 'tf': ['terraform'],
\ 'hcl': ['terraform'],
\ 'go': ['gofmt'],
\}

let g:ale_fix_on_save = 1

" Autocomplete
" Enable automatic imports from external TypeScript modules
let g:ale_completion_tsserver_autoimport = 1

" Status Line
let g:airline_theme='deus'

" Integrate ALE with vim-airline
let g:airline#extensions#ale#enabled = 1

" Search
set incsearch " Incremental search (as you type)
set smartcase " Ignore case when searching lowercase

nmap <leader>p :Files<CR>

" Edit
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
