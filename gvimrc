"GVIM specific config
if has('gui_running')
    set guifont=Hack:h10
    colorscheme base16-ocean
    "start maximized
    au GUIEnter * simalt ~x
    "set where to store backups
    set backupdir=C:\Users\Alvaro\AppData\Local\VimTemp
    "set where to store swapfiles
    set dir=C:\Users\Alvaro\AppData\Local\VimTemp
    let $MYVIMRC=$HOME.'\.vim\.vimrc'
    "Ignore Files/Directories for Fuzzy Finders
    set wildignore+=*/AppData/*
endif

"if has('autocmd')
"          autocmd GUIEnter * set visualbell t_vb=
"endif

