" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/Vim/plugged')
""    Plug 'thiagoalessio/rainbow_levels.vim'

    Plug 'raimondi/delimitmate'

    Plug 'morhetz/gruvbox' "color scheme

    Plug 'vim-scripts/sessionman.vim' "Save, open, etc  session: SessionSave, SessionOpen
    
    if has("gui_running")
        Plug 'itchyny/lightline.vim' "awesome status line (bottom page)
    endif

    Plug 'terryma/vim-multiple-cursors' "Multiple selection like Sublime-text: ctrl-n & ctrl-p & ctrl-x (evidenzia il successivo, toglie selezione su quello sotto il cursore
                                        " salta una selezione  --> poi c: per  change text, I per inserire  all'inizio del testo, A per inserire  in coda
    Plug 'mbbill/undotree' "Gestore Undotree

    Plug 'scrooloose/nerdtree' "folder visualization

    Plug 'data-statiker/vim-xml'   "xml pretty print F5. (salvata macro @x per gli errori in linee con property)

    Plug 'altercation/vim-colors-solarized' "color schema
    
    Plug 'sukima/xmledit' "tool for xml edit

    Plug 'ervandew/supertab' "let TAB do magic! (autocomplete)

    Plug 'tpope/vim-repeat'

    Plug 'svermeulen/vim-easyclip' "to modify the use of dd, yy, mm etc...

    Plug 'tpope/vim-surround'   "surround made fun, cs[( -> Change Surround [ to (; ds' -> Delete Surround; ysiw] (iw is a text object) to surround a word; yss) to surround a line; 
                                "Press a capital V (for linewise visual mode) followed by S<p class="important"> To surround a line
    "Plug 'w0rp/ale'     "Asynchronous Lint Engine
    Plug 'KabbAmine/lazyList.vim' "Crea Liste 

    Plug 'junegunn/vim-easy-align' "Folle plugin di allineamento

    Plug 'tpope/vim-fugitive'

    "Plug 'prabirshrestha/async.vim'
    
    "Plug 'prabirshrestha/vim-lsp'

    Plug 'neoclide/coc.nvim', {'branch': 'release'}

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

if has("gui_running")
    "Set windows maximized at startup
    au GUIEnter * simalt ~x
endif
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

"Folding
"set foldmethod=indent
"set foldcolumn=4 " the number of columns to use for folding display at the left
"set foldlevel=99

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

"split
set splitbelow
set splitright

"persistnt_undo
set undofile
set undodir=C:\Users\giuseppe.garofalo\Vim\undodir 
set undolevels=1000

"set for lightline (mostra sempre la linea di stato)
set laststatus=2
set noshowmode "per nascondere l'ultima riga (la mostra il plugin)
"let g:lightline = { 
"    \ 'colorscheme': 'gruvbox' 
"    \ }
"
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'cocstatus': 'coc#status'
      \ },
      \ }

" Coc command
" Use auocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

"CocCommand coc-java compile progect
nnoremap <leader>jc :CocCommand java.workspace.compile<cr>
nnoremap <leader>o :CocCommand java.action.organizeImports<cr>
nnoremap <leader>cl :CocCommand java.clean.workspace<cr>
nnoremap <leader>up :CocCommand java.projectConfiguration.update<cr>

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

"Go un current folder with <leader>cd
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
"OpenNerdTree on current file
map <leader>r :NERDTreeFind<cr>
"Go to c:\Utils\Progetti with <leader>cdp
nnoremap <leader>cdp :cd c:\Utils\Progetti<CR>:pwd<CR>

"Show command history on F1
nnoremap <F1> q: 
"Show search history on F2
nnoremap <F2> q/ 
"remap F3 to open terminal
nnoremap <F3> :terminal<cr>
" remap F4 to wrap text
nnoremap <F4> :set wrap!<cr>
" Remap F5 to pretty print XML
nnoremap <silent> <F5> :<C-U>call xmlexpander#expand() <CR>
" remap F6 to toggle NerdTree
nnoremap <F6> :NERDTreeToggle<cr>
" remap F7 to toggle UndoTree
nnoremap <F7> :UndotreeToggle<cr>
" move vertically by visual line with j and k
"nnoremap j gj 
"nnoremap k gk
"Usa il Tab e Shift Tab per indentare e spostare il testo 
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>
"
" <leader>* to count occ of word under cursor
map <leader>* *<C-O>:%s///gn<CR>

" save with <leader>s (also in insert mode)
nnoremap <leader>s :w<CR> 
inoremap <leader>s <C-c>:w<CR>

"restore Mark obsucred by vim-easyclip
nnoremap <leader>m m

" SaveSession with <leader>ss
nnoremap <leader>ss :SessionSave<CR>
"
" Move visual selection
"vnoremap J :m '>+1gv=gv<CR>
"vnoremap K :m '<-2gv=gv<CR>

"Split Move
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Rainbow Level conf
" Creating a mapping to turn RainbowLevel on and off:
"map <leader>l :RainbowLevelsToggle<cr>
"" Gruvbox theme for RainbowLevel
"let g:rainbow_levels = [
"            \{'ctermfg': 142, 'guifg': '#b8bb26'},
"            \{'ctermfg': 108, 'guifg': '#8ec07c'},
"            \{'ctermfg': 109, 'guifg': '#83a598'},
"            \{'ctermfg': 175, 'guifg': '#d3869b'},
"            \{'ctermfg': 167, 'guifg': '#fb4934'},
"            \{'ctermfg': 208, 'guifg': '#fe8019'},
"            \{'ctermfg': 214, 'guifg': '#fabd2f'},
"            \{'ctermfg': 223, 'guifg': '#ebdbb2'},
"            \{'ctermfg': 245, 'guifg': '#928374'}]

"Navigazione tra i tab
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
nnoremap tn  :tabnew<CR>

"LazyList 1. - * 
"
" Note the space after the command
nnoremap gli :LazyList 
vnoremap gli :LazyList 
let g:lazylist_omap = 'il'
let g:lazylist_maps = [
            \ 'gl',
            \ {
            \ 'l'  : '',
            \ '*'  : '* ',
            \ '-'   : '- ',
            \ '+'   : '+ ',
            \ 't'   : '- [ ] ',
            \ '2'  : '%2%. ',
            \ '3'  : '%3%. ',
            \ '4'  : '%4%. ',
            \ '5'  : '%5%. ',
            \ '6'  : '%6%. ',
            \ '7'  : '%7%. ',
            \ '8'  : '%8%. ',
            \ '9'  : '%9%. ',
            \ '.1' : '1.%1%. ',
            \ '.2' : '2.%1%. ',
            \ '.3' : '3.%1%. ',
            \ '.4' : '4.%1%. ',
            \ '.5' : '5.%1%. ',
            \ '.6' : '6.%1%. ',
            \ '.7' : '7.%1%. ',
            \ '.8' : '8.%1%. ',
            \ '.9' : '9.%1%. ',
            \ }
            \ ]

"easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

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

"LSP Java
""if executable('java') && filereadable(expand('~/Vim/lsp/plugin/sorg.eclipse.equinox.launcher_1.4.0.v20161219-1356.jar'))
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'eclipse.jdt.ls',
"        \ 'cmd': {server_info->[
"        \     'java',
"        \     '-Declipse.application=org.eclipse.jdt.ls.core.id1',
"        \     '-Dosgi.bundles.defaultStartLevel=4',
"        \     '-Declipse.product=org.eclipse.jdt.ls.core.product',
"        \     '-Dlog.level=ALL',
"        \     '-noverify',
"        \     '-Dfile.encoding=UTF-8',
"        \     '-Xmx1G',
"        \     '-jar',
"        \     expand('~/Vim/lsp/plugin/sorg.eclipse.equinox.launcher_1.4.0.v20161219-1356.jar'),
"        \     '-configuration',
"        \     expand('~/Vim/lsp/config_win'),
"        \     '-data',
"        \     getcwd()
"        \ ]},
"        \ 'whitelist': ['java'],
"        \ })
"endif
