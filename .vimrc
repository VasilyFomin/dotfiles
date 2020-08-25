if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'mileszs/ack.vim'
Plug 'joshdick/onedark.vim'
Plug 'tomtom/tcomment_vim'
Plug 'sheerun/vim-polyglot'
Plug 'gruvbox-community/gruvbox'
Plug 'junegunn/fzf', { 'do': function('fzf#install') }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tmux-plugins/vim-tmux-focus-events'
" "K" to jump to man, :make to source tmux.conf, g! exec lines, g!! just line
Plug 'tmux-plugins/vim-tmux'
Plug 'vim-utils/vim-man'
Plug 'rust-lang/rust.vim'
Plug 'michaeljsmith/vim-indent-object'

if has('nvim')
  " Also :CocInstall coc-python coc-json coc-cmake coc-html coc-yaml
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif

call plug#end()

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

let mapleader = " "
nnoremap <leader>ff :GFiles<cr>
nnoremap <leader>fF :Files<cr>
nnoremap <leader>ps :Rg<cr>
" Search for word under cursor
nnoremap <leader>pw :Rg <C-R><C-W><CR>
nnoremap <leader>bb :Buffers<cr>

nnoremap <silent> <leader>h :wincmd h<CR>
nnoremap <silent> <leader>j :wincmd j<CR>
nnoremap <silent> <leader>k :wincmd k<CR>
nnoremap <silent> <leader>l :wincmd l<CR>
nnoremap <silent> <leader>op :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

nnoremap <leader>gs :Git<CR>



" it maps conflicting <leader>h keys
let g:gitgutter_map_keys = 0

" jump to the matching bracket, and visually select text in between
" if press =% it'll reindent the matching text
noremap % v%

let g:gruvbox_guisp_fallback = "bg"
let g:gruvbox_contrast_dark = "hard"
" let g:netrw_browse_split=2
let g:netrw_winsize = 25
" let $FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!{.git}/*" 2> /dev/null'
let g:fzf_layout = { 'window' : { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTIONS = '--reverse'

syntax on
colorscheme gruvbox
set background=dark
set noerrorbells

set cursorline
set number
set ignorecase
set smartcase
set smartindent
set nowrap
" Autoread changes from the disk
set autoread

set tabstop=4 softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set formatoptions+=b

" Show matching brackets.
set showmatch
" How many tenths of a second to blink
set matchtime=2
" Show invisible characters
set list
" Reset the listchars
set listchars=""
" make tabs visible
set listchars=tab:▸▸
" show trailing spaces as dots
set listchars+=trail:•
" The character to show in the last column when wrap is off and the line
" continues beyond the right of the screen
set listchars+=extends:>
" The character to show in the last column when wrap is off and the line
" continues beyond the right of the screen
set listchars+=precedes:<

set incsearch
set hlsearch
set wildmenu
set wildmode=longest:full,full
" Set default paste buffer to system buffer
set clipboard=unnamed
set spelllang=en_us
set relativenumber
" set autochdir
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Don't replace current split with the new one
" set splitbelow splitright

set title
set titlestring=%{hostname()}\ \ %F\ \ %{strftime('%Y-%m-%d\ %H:%M',getftime(expand('%')))}

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Uncomment the following to have Vim jump to the last position when reopening a file
if has("autocmd")
 au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
 filetype plugin indent on
endif

" Let's save undo info!
set undofile                " Persistent Undo
set undolevels=1000         " Maximum number of changes that can be undone
set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
set undodir=~/.vim/undo
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif

if !isdirectory($HOME."/.vim/sessions")
    call mkdir($HOME."/.vim/sessions", "", 0700)
endif

set backup
set backupdir=~/.vim/backups
if empty(glob('~/.vim/backups'))
  call mkdir($HOME . "/.vim/backups", "p", 0700)
endif

set directory=~/.vim/swaps
if empty(glob('~/.vim/swaps'))
  call mkdir($HOME . "/.vim/swaps", "p", 0700)
endif

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
