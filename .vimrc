set nocompatible
" Plugin (Vim Plug) Settings {{{
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Fuzzy finder
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
" Plug 'ctrlpvim/ctrlp.vim'

Plug 'tpope/vim-surround'
Plug 'mileszs/ack.vim'

Plug 'w0rp/ale'
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Colorschemes
Plug 'tomasiser/vim-code-dark'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'
call plug#end()
" }}}
let mapleader=" "
" Trying this for now
" TODO: See if this is working for me
let maplocalleader="-"

" TODO: See :h completefunc to improve autocompletion
" coc.vim ? other LSP autocomplete engine

" Sensible default settings for vim UX {{{
syntax enable
set background=dark
" Link system clipboard with unnamed buffer (regular copy and paste)
set clipboard=unnamed
" Disable beeping
set vb t_vb=
" Allows for changing buffer without saving (CAUTION!)
set hidden
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
set relativenumber
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
" }}}


" Manage backup files {{{
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
"TODO: Revise these ones
"Way to open files from current directory
nnoremap <Leader>ew :e <C-R>=fnameescape(expand('%:h')).'/'<cr>
nnoremap <Leader>es :sp <C-R>=fnameescape(expand('%:h')).'/'<cr>
nnoremap <Leader>ev :vsp <C-R>=fnameescape(expand('%:h')).'/'<cr>
nnoremap <Leader>et :tabe <C-R>=fnameescape(expand('%:h')).'/'<cr>
" Other nice editingmappings
nnoremap <Leader>ec :vsplit $MYVIMRC<CR>
nnoremap <Leader>sc :source $MYVIMRC<CR>
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
nnoremap <Leader>f :Files<CR>     " Fuzzy find files in current directory
nnoremap <Leader>g :GFiles<CR>    " Fuzzy find git tracked files in current directory
nnoremap <Leader>/ :BLines<CR>    " Fuzzy find lines in current file
nnoremap <Leader>b :Buffers<CR>   " Fuzzy find an open buffer
nnoremap <Leader>r :Rg<CR>        " Fuzzy find text in the working directory
nnoremap <Leader>cc :Commands<CR> " Fuzzy find Vim commands (like Ctrl-Shift-P
"                                 " in VSC or Sublime
" }}}

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


" Vimscript file settings ------------------------ {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
