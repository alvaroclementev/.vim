set nocompatible
" Plugin (Vim Plug) Settings {{{
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Fuzzy finder
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
" Plug 'mileszs/ack.vim'
" Plug 'ctrlpvim/ctrlp.vim'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'

" Language related plugins
" Plug 'w0rp/ale'
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Lisps
Plug 'guns/vim-sexp' "For selecting forms
Plug 'tpope/vim-sexp-mappings-for-regular-people'
" Plug 'alvaroclementev/vim-scheme', { 'for': 'scheme', 'on': 'SchemeConnect' }
Plug 'jpalardy/vim-slime'

" Colorschemes
Plug 'tomasiser/vim-code-dark'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'
call plug#end()
" }}}
let mapleader=" "
nnoremap <Space> <NOP>
" Trying this for now
" TODO: See if this is working for me
let maplocalleader="-"

" Sensible default settings for vim UX {{{
syntax enable
set background=dark
let base16colorspace=256
colorscheme base16-default-dark
" Link system clipboard with unnamed buffer (regular copy and paste)
" set clipboard=unnamedplus
" Disable beeping
set vb t_vb=
" Allows for changing buffer without saving (CAUTION!)
set hidden
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
set ignorecase
set smartcase

nnoremap j gj
nnoremap k gk
" }}}

" General editing settings {{{
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set smartcase

set number
" set relativenumber
set wrap
set linebreak
set nolist
set backspace=indent,eol,start
set wildmenu
set lazyredraw
set showmatch

" Where does the new file appear when splitting
set splitright
set splitbelow

set incsearch
set hlsearch
" }}}

" Statusline settings {{{
set encoding=utf-8
set laststatus=2
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" TODO: Review this customization
" function! AirlineInit()
"     let g:airline_section_z = '%l%c'
" endfunction
" autocmd VimEnter * call AirlineInit()
" }}}


" Manage backup files {{{
set noswapfile
set nobackup
set nowritebackup
" }}}


" Folding {{{
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
" }}}

" Custom MAPPINGS {{{
" Split navigation
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l

" Buffer navigation
nnoremap gt :bn<CR>
nnoremap gT :bn<CR>

" Spell Checking
nnoremap <silent> <F3> :setlocal spell! spelllang=en_us<CR>

"TODO: Revise these ones
"Way to open files from current directory
nnoremap <Leader>ew :e <C-R>=fnameescape(expand('%:h')).'/'<cr>
nnoremap <Leader>es :sp <C-R>=fnameescape(expand('%:h')).'/'<cr>
nnoremap <Leader>ev :vsp <C-R>=fnameescape(expand('%:h')).'/'<cr>
nnoremap <Leader>et :tabe <C-R>=fnameescape(expand('%:h')).'/'<cr>
" Other nice editingmappings
nnoremap <Leader>ec :vsplit $MYVIMRC<CR>
nnoremap <Leader>sc :source $MYVIMRC<CR>
nnoremap <Leader>sf :source %<CR>
" Open previous buffer on vsplit
nnoremap <Leader>ep :execute "rightbelow vsplit " . bufname("#")<cr>
" Manage Trailing Whitespaces
nnoremap <silent> <Leader>td mz:%s/\s\+$//<CR>`z
nnoremap <silent> <Leader>tw :match Error /\s\+$/<CR>
nnoremap <silent> <Leader>tW :match<CR>

"(wrapped lines are not ignored)
" set textwidth=80
"Map \v to turn very magic mode in searches and substitutions
nnoremap / /\v
nnoremap ? ?\v
vnoremap / /\v
vnoremap ? ?\v
" Map <Space>h to remove highlight when searching
nnoremap <silent> <Leader>h :nohlsearch<CR>
nnoremap <Leader>* /<C-R><C-A><CR>
nnoremap <Leader># ?<C-R><C-A><CR>

"Capitalize WORD under cursor in INSERT MODE
inoremap <C-U> <ESC>viWUEa
"Capitalize WORD under cursor in NORMAL MODE
nnoremap <Leader>u viWUE
" }}}

" Common typos when exiting or saving {{{
command! W w
command! WQ wq
command! Wq wq
command! Q q
" }}}


" NERDTree settings (make NERDTreeCWD the active buffer's directory) {{{
"set autochdir
"let NERDTreeChDirMode=2
nnoremap <Leader>n :NERDTreeToggle<CR>
" }}}

" The Silver Searcher (Ag) TODO: change grepprg to use Ag {{{
" if executable('ag')
"     "Use ag over grep
"     set grepprg=ag\ --nogroup\ --nocolor
"
"     "Set up ack.vim to use Ag
"     let g:ackprg = 'ag --nogroup --nocolor --column'
"
"     "Use Ag in Ctrl-P for listing files.
"     let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"
"     "Ag is fast enough CtrlP needs no cache
"     let g:ctrp_use_caching = 0
" endif
" }}}

"" Ctrl-P Settings {{{
"let g:ctrlp_map='<c-p>'
"let g:ctrlp_cmd='CtrlP'
"let g:ctrlp_working_path_mode='ra'
""If a file is already open, open new file in new pane
""let g:ctrlp_switch_buffer='et'
""To ignore files in .gitignore and speed it up by x100
"let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
"let g:ctrlp_prompt_mappings = { 'AcceptSelection("e")': ['<cr>'] }
"let g:ctrlp_custom_ignore = 'node_modules\|.DS_Store\|.git\|node_modules/|.DS_Store/|.git/'
"" }}}

" FZF Settings {{{
nnoremap <Leader>f :GFiles<CR>    " Fuzzy find git tracked files in current directory
nnoremap <Leader>F :Files<CR>     " Fuzzy find files in current directory
nnoremap <Leader>/ :BLines<CR>    " Fuzzy find lines in current file
nnoremap <Leader>b :Buffers<CR>   " Fuzzy find an open buffer
nnoremap <Leader>r :Rg<CR>        " Fuzzy find text in the working directory
nnoremap <Leader>cc :Commands<CR> " Fuzzy find Vim commands (like Ctrl-Shift-P
nnoremap <Leader>H :Help<CR>     " Fuzzy find files in current directory
"                                 " in VSC or Sublime
" }}}

" Coc.vim settings {{{
" TODO: Test these commented settings
" For better display for messages
"set cmdheight=2

" You will have bad experience for diagnostic messages when it's
" default 4000
set updatetime=300
" Don't give |ins-completion-menu| messages
"set shotmess+=c
" Always show signcolumns
"set signcolumns=yes
" Highlight symbol under the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" to match the comments in the JSONC filetype
autocmd FileType json syntax match Comment +\/\/.\+$+

" To trigger the completion with <TAB>
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Make <TAB> the custom key to trigger completion
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
" Make C-Space trigger the suggestions
inoremap <silent><expr> <C-Space> coc#refresh()
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show the documentation
nmap K <SID>show_documentation()<CR>

function! s:show_documentation()
    echom "Showing documentation"
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h ' . expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Show showSignatureHelp
inoremap <C-H> <C-\><C-O>:call CocActionAsync('showSignatureHelp')<CR>

" Remap for rename current word
nmap <Leader>cn <Plug>(coc-rename)

" Remap for format selected region
xmap <Leader>f <Plug>(coc-format-selected)
vmap <Leader>f <Plug>(coc-format-selected)
command! -nargs=0 Format :call CocAction('format')
" }}}

" ALE Linting settings {{{
"let g:ale_linters = {
  "\ 'python': ['flake8'] ,
  "\ }
let g:ale_lint_on_text_changed='never'

" TRY THIS OUT!
let g:ale_sign_error='●' "Less aggresive sign error than '>>'
let g:ale_sign_warning='.'
let g:ale_lint_on_open=0 "Less distracting when opening a file
" }}}

" vim-SLIME
let g:slime_target='tmux'
let g:slime_paste_file=tempname()
let g:slime_default_config={"socket_name": "default", "target_pane": "{right-of}"}
let g:slime_dont_ask_default=1

" FileType specific settings {{{
augroup filetype_make
    " Makefiles need explicit tab characters
    autocmd!
    autocmd FileType make setlocal noexpandtab
augroup END

" }}}

" Vimscript file settings ------------------------ {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
