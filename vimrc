runtime bundle/Pathogen.vim/autoload/pathogen.vim

scriptencoding utf-8
set encoding=utf-8
syntax enable

set number
set ruler
set showcmd
set nocompatible
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
set nobackup
set wildmenu
set wildmode=full
set cursorline
set cursorcolumn
set cindent
set smarttab
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set showmatch
set incsearch
set hlsearch
set nolist
set listchars=tab:\|_,trail:·
set selectmode+=mouse
set ttyfast
set history=1000
set undolevels=1000
set hidden
set autoread
set cmdheight=2
set lazyredraw
set magic

set lbr
set textwidth=500

set noerrorbells
set novisualbell
set t_vb=

filetype plugin on
filetype indent on

let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

if has("autocmd")
    autocmd BufReadPost *
    \   if line("'\"") > 1 && line("'\"") <= line("$") |
    \       exe "normal! g'\"" |
    \   endif
endif

command! W w !sudo tee % > /dev/null

set wildignore=*.o,*.class,*.pyc

map <leader>bd :bd<cr>
map <leader>ba: bufdo bd<cr>

if has("mac") || has("macunix") || has("gui_macvim")
    set gfn=Source\ Code\ Pro:h25,Menlo:h25
elseif has("gui_gtk2")
    set guifont=Monaco\ for\ Powerline\ 25
elseif has("win16") || has("win32")
    set gfn=Source\ Code\ Pro:h25,Bitstream\ Vera\ Sans\ Mono:h25
elseif has("linux")
    set gfn=Source\ Code\ Pro:h25,Bitstream\ Vera\ Sans\ Mono:h25
elseif has("unix")
    set gfn=Monospace\ 25
endif

if has("gui_macvim")
    set fuoptions=maxvert,maxhorz
    autocmd GUIEnter * set fullscreen
endif

set tags=./tags,tags
set tags+=~/.vim/systags

set cscopequickfix=c-,d-,e-,f-,g0,i-,s-,t-
if (executable("gtags-cscope"))
    set csprg=gtags-cscope
    let db = findfile("GTAGS", ".;")
    let CtagsCscope_Auto_Map = 1
    let g:Gtags_Auto_Update = 1
    let g:Gtags_No_Auto_Jump = 1
    if (!empty(db))
        cs add GTAGS
    endif
endif

call pathogen#infect()
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'Pathogen.vim'
Plugin 'tpope/Vim-Fugitive'
Plugin 'The-NERD-tree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Valloric/YouCompleteMe'
Bundle 'majutsushi/tagbar'
Plugin 'A.vim'
Plugin 'gtags.vim'
Plugin 'mbbill/fencview', {'name': 'FencView.vim'}
Plugin 'honza/Vim-Snippets'
Plugin 'Mizuchi/STL-Syntax'
Plugin 'DoxygenToolkit.vim'
Plugin 'DirDiff.vim'
Plugin 'scrooloose/syntastic', {'name': 'Syntasic'}
Plugin 'bling/vim-airline', {'name': 'Airline'}
Plugin 'derekwyatt/vim-scala'
Plugin 'tpope/Vim-Markdown'
Plugin 'tpope/vim-surround', {'name': 'Surround.vim'}
Plugin 'Lokaltog/vim-easymotion', {'name': 'EasyMotion'}
Plugin 'kien/rainbow_parentheses.vim', {'name': 'RainbowParentheses'}
call vundle#end()
filetype plugin on
filetype indent on

set background=dark
let g:solarized_termcolors=16
let g:solarized_termtrans=0
color solarized

let NERDShutUp=1
let NERDTreeWinSize=25

set laststatus=2
set t_co=256

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='self'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1

let g:airline_left_sep          = '⮀'
let g:airline_left_alt_sep      = '⮁'
let g:airline_right_sep         = '⮂'
let g:airline_right_alt_sep     = '⮃'
let g:airline_symbols.branch    = '⭠'
let g:airline_symbols.readonly   = '⭤'
let g:airline_symbols.linenr = '⭡'
let g:airline_symbols.paste = 'Þ'

let Tlist_WinWidth=25
let Tlist_Ctags_Cmd='/usr/local/bin/ctags -R --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+liaS --extra=+q --extra=+f'
let Tlist_Auto_Update=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1

let $FENCVIEW_TELLENC="~/.vim/bundle/FencView.vim/tellfenc/tellenc"
let g:fencview_autodetect=1

autocmd BufWritePre * :%s/\s\+$//e
set viminfo='100,\"2500,:200,%,n~/.viminfo

au BufNewFile,BufRead *.ic set filetype=cpp

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:Dont_Jump_Automatically = 1
nnoremap <F8> :TagbarToggle<CR>
nnoremap <leader>tt :NERDTreeToggle<CR>
map <C-L> :bnext<cr>
map <C-H> :bprevious<cr>
map <C-N> :cn<CR>
map <C-P> :cp<CR>
map <C-A> <HOME>
map <C-E> <END>
nnoremap <leader>gc :GtagsCursor<CR>
nnoremap <leader>cc :cclose<CR>
nnoremap <leader>nh :noh<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

