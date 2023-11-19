set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'https://github.com/tpope/vim-fugitive.git'

call plug#end()

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Display options
set encoding=utf-8
set showmode
set showcmd
set modeline
set ruler
set number
"set notitle noicon
set titlestring=%t
" Persist color scheme in tmux
set background=dark
" Status bar
set laststatus=2

" Airline status line config
" let g:airline_powerline_fonts = 1
let g:airline_symbols_ascii = 1
let g:airline_left_sep='>'
let g:airline_right_sep='<'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_theme='bubblegum'
" let g:airline_theme='dark'
" let g:airline_theme='papercolor'

" Turn on syntax highlighting.
syntax on
" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Uncomment below to set the max textwidth. Use a value corresponding to the width of your screen.
" set textwidth=79
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Automatically wrap text that extends beyond the screen length.
set wrap
set linebreak
set showbreak=▹

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5

" Fixes common backspace problems
set backspace=indent,eol,start

" Vim's auto indentation feature does not work properly with text copied from outisde of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

" Lines of history to save
set history=50

" Enable starting a new buffer without being forced to write current changes
set hidden

" Direction keys for wrapped lines
nnoremap <silent> k gk
nnoremap <silent> j gj
nnoremap <silent> <Up> gk
nnoremap <silent> <Down> gj
inoremap <silent> <Up> <Esc>gka
inoremap <silent> <Down> <Esc>gja

" Bash / emacs keys for command line
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Change the cursor at insert mode
let &t_ti.="\<Esc>[1 q"
let &t_SI.="\<Esc>[5 q"
let &t_EI.="\<Esc>[1 q"
let &t_te.="\<Esc>[0 q"

" Toggle line-wrap
map <Leader>w <Esc>:set wrap!<CR>

" Open file under cursor in new tab
map <Leader>t <Esc><C-W>gF<CR>:tabm<CR>

" Base64 decode word under cursor
nmap <Leader>b :!echo <C-R><C-W> \| base64 -d<CR>

" grep recursively for word under cursor
nmap <Leader>g :tabnew\|read !grep -Hnr '<C-R><C-W>'<CR>
