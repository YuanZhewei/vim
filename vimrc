runtime bundle/Pathogen.vim/autoload/pathogen.vim

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
set list
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

if has("mac") || has("macunix")
    set gfn=Source\ Code\ Pro:h15,Menlo:h15
elseif has("win16") || has("win32")
    set gfn=Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
elseif has("linux")
    set gfn=Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
elseif has("unix")
    set gfn=Monospace\ 11
endif

if has("gui_macvim")
    set fuoptions=maxvert,maxhorz
    autocmd GUIEnter * set fullscreen
endif

set tags=./tags,tags
set tags+=~/.vim/systags

set cscopequickfix=c-,d-,e-,f-,g0,i-,s-,t-
if (executable("gtags-cscope") && has("gtags-cscope"))
    set csprg=gtags-cscope
    let db = findfile("GTAGS", ".;")
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
Plugin 'taglist.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'A.vim'
Plugin 'gtags.vim'
Plugin 'mbbill/fencview', {'name': 'FencView.vim'}
Plugin 'SirVer/UltiSnips'
Plugin 'honza/Vim-Snippets'
Plugin 'Mizuchi/STL-Syntax'
Plugin 'DoxygenToolkit.vim'
Plugin 'scrooloose/syntastic', {'name': 'Syntasic'}
Plugin 'bling/vim-airline', {'name': 'Airline'}

Plugin 'tpope/Vim-Markdown'
Plugin 'tpope/vim-surround', {'name': 'Surround.vim'}
Plugin 'Lokaltog/vim-easymotion', {'name': 'EasyMotion'}
Plugin 'kien/rainbow_parentheses.vim', {'name': 'RainbowParentheses'}
Plugin 'fatih/vim-go'
call vundle#end()
filetype plugin on
filetype indent on

set background=dark
let g:solarized_termtrans=0
color solarized

let NERDShutUp=1
let NERDTreeWinSize=25

set laststatus=2
set guifont=Monaco\ for\ Powerline
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

let g:ycm_error_symbol='>>'
let g:ycm_warning_symbol='>'
let g:ycm_complete_in_strings=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_key_detailed_diagnostics='<leader>d'
let g:ycm_goto_buffer_command='same-buffer'
"let g:ycm_goto_buffer_command='new-tab'
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"
"let g:ycm_semantic_triggers.c = ['->', '.', ' ', '\t', '(', '[', '&']
nnoremap <leader>jd :YcmCompleter GoTo<CR>


let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

let $FENCVIEW_TELLENC="~/.vim/bundle/FencView.vim/tellfenc/tellenc"
let g:fencview_autodetect=1

autocmd BufWritePre * :%s/\s\+$//e
set viminfo='100,\"2500,:200,%,n~/.viminfo

let g:go_fmt_command = "goimports"
let g:go_highlight_functions=1
let g:go_highlight_methods=1
let g:go_highlight_structs=1
let g:go_highlight_operators=1
let g:go_highlight_build_constraints=1

let g:syntastic_go_checkers=['go', 'golint', 'errcheck']
au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>

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
nnoremap <leader>tl :Tlist<CR>
nnoremap <leader>tt :NERDTreeToggle<CR>
map <C-L> :bnext<cr>
map <C-H> :bprevious<cr>
map <C-N> :cn<CR>
map <C-P> :cp<CR>
nnoremap <leader>gc :GtagsCursor<CR>
nnoremap <leader>cc :cclose<CR>
