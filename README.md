VIMFILES
========

Files and other settings for VIM's config 
-----------------------------------------

## Setup

### Windows
  * Clone this repo under GVIM's *$HOME* location (*C:\Users\USERNAME* by
default). 
  * Create a symlink for both `.vimrc` and `_gvimrc` in the *%HOME%* directory
    and link to both `.vim/.vimrc` and `.vim/gvimrc`.
Open Command Line in Administrator mode:
```DOS
mklink %HOME%\.vimrc %HOME%\.vim\.vimrc
mklink %HOME%\_gvimrc %HOME%\.vim\gvimrc
```

### Linux
  * Clone this repo in the home directory (~)
  * Create a symlink for the .vimrc
```bash
ln -s ~/.vim/.vimrc ~/.vimrc
```

### Plugins
Vundle is configured in the .vimrc file, but needs to be installed manually in
each new machine using this file. To install navigate to *.vim/* and
run in cmd:
```
git clone https://github.com/VundleVim/Vundle.vim.git ./bundle/Vundle.vim
```

After Vundle is installed, run from inside vim
```vim
:PluginInstall
```

#### List of plugins installed
  * **Vundle.vim**: Plugin manager
  * **NERDTree**: Tree filesystem display
  * **Ctrl-P**: Fuzzy file finder
