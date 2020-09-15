set nocompatible
set encoding=utf-8




if empty(glob(expand(" ~/.vim/autoload/plug.vim")))
  silent !curl -fLo  ~/.vim/autoload/plug.vim  --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif
source  ~/.vim/autoload/plug.vim 

call plug#begin('~/.vim/plugged')
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'zchee/deoplete-go', { 'do': 'make' }
Plug 'zchee/deoplete-jedi'
"if has('win32') || has('win64')
"  Plug 'tbodt/deoplete-tabnine', { 'do': 'powershell.exe .\install.ps1' }
"else
"  Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
"endif
Plug 'w0rp/ale'
Plug 'Raimondi/delimitMate'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do' : './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'lambdalisue/suda.vim'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/fcitx.vim'
Plug 'Yggdroot/indentLine'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'}
Plug 'francoiscabrol/ranger.vim'
Plug 'alvan/vim-closetag'
Plug 'flazz/vim-colorschemes'
call plug#end()

filetype plugin indent on

set t_Co=256
syntax enable
set background=dark
"colorscheme solarized
colorscheme molokai
"colorscheme space-vim-dark

set mouse=a

set number
set relativenumber
set showmode
set showcmd
set showmatch
set autoread
set ruler
set nowrap
set linebreak
set autoindent
set noerrorbells
set expandtab
set hlsearch
set ignorecase
set smartcase
set scrolloff=5
set sidescrolloff=15
set wildmenu
set wildmode=longest:list,full
"set ambiwidth=double
set updatetime=100
set clipboard=unnamed
set noswapfile
set nobackup
set undofile
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
set undodir=~/.vim/.undo//
set backspace=indent,eol,start
set pastetoggle=<F10>

let mapleader = ','
let g:mapleader = ','

nnoremap <C-N> :bn<CR>                                                              
nnoremap <C-P> :bp<CR> 

" suda smart edit
let g:suda_smart_edit = 1

let g:deoplete#enable_at_startup = 1

" fzf
nnoremap <silent> <F4> :Files<CR>

let g:UltiSnipsExpandTrigger="<tab>"                                                         
let g:UltiSnipsJumpForwardTrigger="<c-b>"                                                    
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:rainbow_active = 1

let g:airline_theme = 'powerlineish'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1 
let g:airline#extensions#tmuxline#enabled = 1
let g:airline#extensions#ale#enabled = 1
if !exists('g:airline_symbols')
          let g:airline_symbols = {}
  endif
" unicode symbols
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'
" powerline symbols
if get(g:, 'airline_powerline_fonts', 0)
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
  let g:airline_symbols.maxlinenr= ''
endif
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type= 2
let g:airline#extensions#tabline#show_tab_type = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9


autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeWinPos = "right"
map <F2> :NERDTreeToggle<CR> 
autocmd VimEnter *
            \   if !argc()
            \ |   Startify
            \ |   NERDTree
            \ |   wincmd w
            \ | endif



" Tagbar
 let g:tagbar_width=35
 let g:tagbar_autofocus=1
 let g:tagbar_left = 1
 nmap <F3> :TagbarToggle<CR>






let g:startify_custom_header = [
                                \
                                \'      ▄█       ███    █▄  ███▄▄▄▄      ▄████████     ███      ▄█   ▄████████',
                                \'     ███       ███    ███ ███▀▀▀██▄   ███    ███ ▀█████████▄ ███  ███    ███',
                                \'     ███       ███    ███ ███   ███   ███    ███    ▀███▀▀██ ███▌ ███    █▀ ',
                                \'     ███       ███    ███ ███   ███   ███    ███     ███   ▀ ███▌ ███       ',
                                \'     ███       ███    ███ ███   ███ ▀███████████     ███     ███▌ ███       ',
                                \'     ███       ███    ███ ███   ███   ███    ███     ███     ███  ███    █▄ ',
                                \'     ███▌    ▄ ███    ███ ███   ███   ███    ███     ███     ███  ███    ███',
                                \'     █████▄▄██ ████████▀   ▀█   █▀    ███    █▀     ▄████▀   █▀   ████████▀ '
                                \  ]

let g:startify_custom_footer = [
                                \'     _        ___ ______  __  _____        __   ___   ___    ____  ____    ____  __ ',
                                \'    | |      /  _]      ||  |/ ___/       /  ] /   \ |   \  |    ||    \  /    ||  |',
                                \'    | |     /  [_|      ||_ (   \_       /  / |     ||    \  |  | |  _  ||   __||  |',
                                \'    | |___ |    _]_|  |_|  \|\__  |     /  /  |  O  ||  D  | |  | |  |  ||  |  ||__|',
                                \'    |     ||   [_  |  |      /  \ |    /   \_ |     ||     | |  | |  |  ||  |_ | __ ',
                                \'    |     ||     | |  |      \    |    \     ||     ||     | |  | |  |  ||     ||  |',
                                \'    |_____||_____| |__|       \___|     \____| \___/ |_____||____||__|__||___,_||__|'
                                \ 
                                \ ]


" closetag 
"
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.xml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml,xml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'
