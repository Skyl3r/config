"set shell to bash rather than fish (for vim plugins that use bash)
if &shell =~# 'fish$'
    set shell=sh
endif

"set tabs to 4 spaces
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

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
"ignore case on search
set ignorecase

"turn on fish compiler, set fish setting
compiler fish
setlocal textwidth=79
setlocal foldmethod=expr

