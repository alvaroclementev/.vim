set nocompatible
filetype off

let mapleader=" "

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
if has('gui_running')
Plugin 'chriskempson/base16-vim'
endif
call vundle#end()

filetype plugin indent on

colorscheme base16-ocean
syntax enable
set background=dark
"Link system clipboard with unnamed buffer (regular copy and paste)
set clipboard=unnamed

"Disable beeping
set noerrorbells visualbell t_vb=

set tabstop=4
set softtabstop=4
set expandtab
set number
set relativenumber

set backspace=indent,eol,start
set wildmenu
set lazyredraw
set showmatch

set incsearch
set hlsearch

"Folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent

"Way to open files from currend directory
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

"(wrapped lines are not ignored)
set textwidth=80
"Map \v to turn very magic mode in searches and substitutions
nnoremap / /\v
nnoremap ? ?\v
vnoremap / /\v
vnoremap ? ?\v
"Map ,h to remove highlight when searching
nnoremap <Leader>h :set hlsearch!<CR> 

"NERDTree settings (make NERDTreeCWD the active buffer's directory)
set autochdir
let NERDTreeChDirMode=2
nnoremap <Leader>n :NERDTree<CR>

"Ctrl-P Settings
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_working_path_mode='ra'
"If a file is already open, open new file in new pane
let g:ctrlp_switch_buffer='et'
"To ignore files in .gitignore
"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']