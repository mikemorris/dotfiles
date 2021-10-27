" Automatically install vim-plug if not present
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" call plug#begin('~/.vim/plugged')
call plug#begin('~/.local/share/nvim/plugged')

" Collection of common configurations for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'

" Extensions to built-in LSP, for example, providing type inlay hints
Plug 'nvim-lua/lsp_extensions.nvim'

" Autocompletion framework for built-in LSP
Plug 'nvim-lua/completion-nvim'

" Autocomplete
Plug 'tpope/vim-surround'
" https://github.com/Raimondi/delimitMate
" https://github.com/cohama/lexima.vim
" https://github.com/windwp/nvim-autopairs

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

" Debug
" Plug 'mfussenegger/nvim-dap'

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
\ 'rust': ['cargo'],
\ 'go': ['golangci_lint'],
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

let g:ale_rust_cargo_use_clippy = 1
let g:ale_fix_on_save = 1

" Autocomplete
" https://github.com/nvim-lua/completion-nvim/issues/317
let g:completion_enable_auto_hover = 0

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
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
" Set updatetime of no cursor movement to trigger CursorHold
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
" Avoid showing extra messages when using completion
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" Recently vim can merge signcolumn and number column into one
set signcolumn=number

" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Configure LSP
" https://github.com/neovim/nvim-lspconfig#keybindings-and-completion
" https://sharksforarms.dev/posts/neovim-rust/
lua <<EOF

-- nvim_lsp object
local nvim_lsp = require'lspconfig'

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  require'completion'.on_attach(client)

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)

  -- Goto previous/next diagnostic warning/error
  buf_set_keymap('n', 'g[', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', 'g]', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "rust_analyzer", "gopls", "terraform-ls" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF

" Use <Tab> and <S-Tab> to navigate through completion popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" use <Tab> as trigger keys for completion popup
imap <Tab> <Plug>(completion_smart_tab)
imap <S-Tab> <Plug>(completion_smart_s_tab)

" Code navigation shortcuts
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

" Show diagnostic popup on cursor hold
autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

" Enable type inlay hints
autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
\ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} }
