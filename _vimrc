" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/Vim/plugged')

    Plug 'morhetz/gruvbox'

    Plug 'vim-scripts/sessionman.vim'

    Plug 'itchyny/lightline.vim'
    
    Plug 'terryma/vim-multiple-cursors'    

    Plug 'mbbill/undotree'

    Plug 'scrooloose/nerdtree'    

    Plug 'data-statiker/vim-xml'    

    Plug 'altercation/vim-colors-solarized'
    
    Plug 'sukima/xmledit'

    Plug 'ervandew/supertab'

    Plug 'tpope/vim-repeat'

    Plug 'svermeulen/vim-easyclip'

" Initialize plugin system
call plug#end()

set nocompatible "toglie compatibilità con Vi
syntax on "Visualizzazione sintassi
colorscheme gruvbox "Schema colori
"colorscheme Solarized "Schema colori
" font recuperato qui https://github.com/belluzj/fantasque-sans
set guifont=Fantasque_Sans_Mono:h10:cANSI:qDRAFT
set number "Mostra numeri di riga
set showmatch
set ruler
"
" With a map leader it's possible to do extra key combinations
" " like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","
"
"Carica plugin & indent del file aperto
filetype indent plugin on
"mouse use
set mouse=a
"cd C:/Users/giuseppe.garofalo/Vim
"set tw=360
"set autoindent "indentazione automatica
set smartindent "indentazione automatica intelligente
"Set windows maximized at startup
au GUIEnter * simalt ~x
"toglie bkp file e swp file
set nobackup
set nowritebackup
set noswapfile
set nohidden

set cursorline "evidenzia la riga corrente
set relativenumber "numero di righe relative
"tab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
"Permette di incollare fuori Vim
set clipboard=unnamed
set ignorecase
set smartcase
"No wrap text automatico
set nowrap
" automatically cd into file directory
"autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')
"Mostra quello che scrivi come comando
set showcmd

"tab completation
set wildmenu
set wildmode=list:longest,full


"Ricerca evidenziata e incrementale
set hlsearch
set incsearch

set backspace=indent,eol,start " funzionalità backspace

"persistnt_undo
set undofile
set undodir=C:\Users\giuseppe.garofalo\Vim\undodir 
set undolevels=1000

"set for lightline (mostra sempre la linea di stato)
set laststatus=2
set noshowmode "per nascondere l'ultima riga (la mostra il plugin)
let g:lightline = { 
    \ 'colorscheme': 'gruvbox' 
    \ }
" Set for vim-multiline
" This allows one to a) search for the keyword using * b) turn search results into cursors with Alt-j
set selection=inclusive
nnoremap <silent> <M-j> :MultipleCursorsFind <C-R>/<CR>
vnoremap <silent> <M-j> :MultipleCursorsFind <C-R>/<CR>

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
"
" EasyClip autoFormato on paste
let g:EasyClipAutoFormat = 1

" Remap F5 to pretty print XML
 nnoremap <silent> <F5> :<C-U>call xmlexpander#expand() <CR>
" remap F7 to toggle UndoTree
nnoremap <F7> :UndotreeToggle<cr>
" remap F6 to toggle NerdTree
nnoremap <F6> :NERDTreeToggle<cr>
" remap F4 to wrap text
nnoremap <F4> :set wrap!<cr>

"Usa il Tab e Shift Tab per indentare e spostare il testo 
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>


" Some function
function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal!vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
