" Automatically install vim-plug if not present
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

" Colorschemes
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
" Plug 'ajmwagar/vim-deus'
" Plug 'drewtempelmeyer/palenight.vim'

" Syntax
Plug 'hail2u/vim-css3-syntax'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'HerringtonDarkholme/yats.vim' " TypeScript
" Plug 'elixir-editors/vim-elixir'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'hashivim/vim-hashicorp-tools'

" Lint
Plug 'w0rp/ale'
" Plug 'slashmili/alchemist.vim' " Elixir
" Plug 'neomake/neomake'

" Autocomplete
Plug 'tpope/vim-surround'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

" This setting must be set before ALE is loaded.
" You should not turn this setting on if you wish to use ALE as a completion
" source for other completion plugins, like Deoplete.
" let g:ale_completion_enabled = 1

" Status Line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='base16'

" Integrate ALE with vim-airline
let g:airline#extensions#ale#enabled = 1

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
let base16colorspace=256
set termguicolors
" let g:deus_termcolors=256
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme base16-tomorrow-night

" Set transparent background
" hi Normal guibg=NONE ctermbg=NONE

" Syntax
let g:javascript_plugin_jsdoc = 1

" Fastlane syntax highlighting
au BufNewFile,BufRead Fastfile,Appfile,Snapfile,Scanfile,Gymfile,Matchfile,Deliverfile set filetype=ruby

" TypeScript .tsx support
au BufNewFile,BufRead *.tsx set filetype=typescript

" Lint
let g:ale_fixers = {
\ 'javascript': ['prettier'],
\ 'json': ['prettier'],
\ 'css': ['prettier'],
\ 'markdown': ['prettier'],
\ 'rust': ['rustfmt'],
\ 'tf': ['terraform'],
\ 'hcl': ['terraform'],
\ 'go': ['gofmt'],
\}
let g:ale_linters = {
\ 'javascript': ['flow'],
\ 'go': ['gopls', 'golangci_lint'],
\}
" highlight clear ALEErrorSign
" highlight clear ALEWarningSign
let g:ale_fix_on_save = 1

" Map keys to navigate between lines with errors and warnings.
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Search
set incsearch " Incremental search (as you type)
set smartcase " Ignore case when searching lowercase

nnoremap <leader>a :Ack 

" Add ripgrep support to ack.vim
if executable('rg')
  let g:ackprg = 'rg --vimgrep --no-heading --smart-case'
endif

let g:ctrlp_map = '<leader>p'

" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Window management
set splitbelow splitright
