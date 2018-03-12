" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/Vim/plugged')
    Plug 'thiagoalessio/rainbow_levels.vim'

    Plug 'raimondi/delimitmate'

    Plug 'morhetz/gruvbox' "color scheme

    Plug 'vim-scripts/sessionman.vim' "Save, open, etc  session: SessionSave, SessionOpen

    Plug 'itchyny/lightline.vim' "awesome status line (bottom page)
    
    Plug 'terryma/vim-multiple-cursors' "Multiple selection like Sublime-text: ctrl-n & ctrl-p & ctrl-x (evidenzia il successivo, toglie selezione su quello sotto il cursore
                                        " salta una selezione   
    Plug 'mbbill/undotree' "Gestore Undotree

    Plug 'scrooloose/nerdtree' "folder visualization

    Plug 'data-statiker/vim-xml'   "xml pretty print F5. (salvata macro @x per gli errori in linee con property)

    Plug 'altercation/vim-colors-solarized' "color schema
    
    Plug 'sukima/xmledit' "tool for xml edit

    Plug 'ervandew/supertab' "let TAB do magic! (autocomplete)

    Plug 'tpope/vim-repeat'

    Plug 'svermeulen/vim-easyclip' "to modify the use of dd, yy, mm etc...

" Initialize plugin system
call plug#end()

"set nocompatible "toglie compatibilità con Vi --non più necessario
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
"mouse use
set mouse=a
"cd C:/Users/giuseppe.garofalo/Vim
"
set autoindent "indentazione automatica
"set smartindent "indentazione automatica intelligente
"Carica plugin & indent del file aperto
filetype plugin indent on
"Set windows maximized at startup
au GUIEnter * simalt ~x
"
"toglie bkp file e swp file
set nobackup
set nowritebackup
set noswapfile
set nohidden

set cursorline "evidenzia la riga corrente
set relativenumber "numero di righe relative
"
"tab
set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab
"set smarttab
"
"Permette di incollare fuori Vim
set clipboard=unnamed
"
"No wrap text automatico
set nowrap
"
"Mostra quello che scrivi come comando
set showcmd

"tab completation
set wildmenu
set wildmode=list:longest,full

" Set utf8 as standard encoding 
set encoding=utf8

"Ricerca evidenziata e incrementale
set hlsearch
set incsearch
set ignorecase
set smartcase

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

"Show command history on F1
nnoremap <F1> q: 
"Show search history on F2
nnoremap <F2> q/ 
"
" remap F4 to wrap text
nnoremap <F4> :set wrap!<cr>
" Remap F5 to pretty print XML
nnoremap <silent> <F5> :<C-U>call xmlexpander#expand() <CR>
" remap F6 to toggle NerdTree
nnoremap <F6> :NERDTreeToggle<cr>
" remap F7 to toggle UndoTree
nnoremap <F7> :UndotreeToggle<cr>

"Usa il Tab e Shift Tab per indentare e spostare il testo 
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>
"
" Rainbow Level conf
" Creating a mapping to turn RainbowLevel on and off:
map <leader>l :RainbowLevelsToggle<cr>
" Gruvbox theme for RainbowLevel
let g:rainbow_levels = [
            \{'ctermfg': 142, 'guifg': '#b8bb26'},
            \{'ctermfg': 108, 'guifg': '#8ec07c'},
            \{'ctermfg': 109, 'guifg': '#83a598'},
            \{'ctermfg': 175, 'guifg': '#d3869b'},
            \{'ctermfg': 167, 'guifg': '#fb4934'},
            \{'ctermfg': 208, 'guifg': '#fe8019'},
            \{'ctermfg': 214, 'guifg': '#fabd2f'},
            \{'ctermfg': 223, 'guifg': '#ebdbb2'},
            \{'ctermfg': 245, 'guifg': '#928374'}]

"Navigazione tra i tab
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
nnoremap tn  :tabnew<CR>

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
