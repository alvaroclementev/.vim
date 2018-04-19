"GVIM specific config
if has('gui_running')
    set guifont=Hack:h10
    colorscheme base16-ocean
    "start maximized
    au GUIEnter * simalt ~x
    let $MYVIMRC=$HOME.'\.vim\.vimrc'
    "Ignore Files/Directories for Fuzzy Finders
    set wildignore+=*/AppData/*
    set vb t_vb=
endif

"if has('autocmd')
"          autocmd GUIEnter * set visualbell t_vb=
"endif

