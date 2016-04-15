"set shell to bash rather than fish (for plugins that use bash)
if &shell =~# 'fish$'
    set shell=sh
endif

"set mouse usage to all
set ttymouse=xterm2
set mouse=a

"map ctrl-c to copy (in visual mode)
vmap <C-c> y:call system("pbcopy", getreg("\""))<CR><CR>

"set tabs to 4 spaces
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)

"turn on fish compiler, set fish setting
compiler fish
setlocal textwidth=79
setlocal foldmethod=expr

"syntax highlighting on
syntax on
"set line numbers on
set number
"set ruler (line, column)
set ruler
"show commands as typing them
set showcmd
"toggle insert paste with F10 key
set pastetoggle=<F10>
"set paste on
set paste
"ignore case on search
set ignorecase
