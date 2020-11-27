```

█▀▀ █▀█ █▄░█ █▀▀ █ █▀▀   █▀ ▀█▀ █▀▀ █▀█ █▀
█▄▄ █▄█ █░▀█ █▀░ █ █▄█   ▄█ ░█░ ██▄ █▀▀ ▄█

____________________________________________________
```

# Install NeoVim

## Ubuntu
```
sudo apt install neovim
```

## Create a .config folder to store the config files<br />

+ Make a directory first <br />
```
mkdir ~/.config/nvim
```
+ Create a init.vim file to store all the source files <br />
```
touch ~/.config/nvim/init.vim
```

## Install vim-plug a plugin manager for vim plugins<br />

+ This command will install vim-plug to the "~/.config/nvim/autoload/" directory <br />
```
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## Create a plugins.vim file<br />

+ We will add the plugins to the "~/.config/nvim/vim-plug/plugins.vim" so that the "init.vim" is not cluttered
```
mkdir ~/.config/nvim/vim-plug
touch ~/.config/nvim/vim-plug/plugins.vim
```

## Add plugins<br />

+  Now we add the "~/.config/nvim/vim-plug/plugins.vim" to this file <br />
```
" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" autocmd VimEnter * PlugInstall
" autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

	" Better Syntax Support
	Plug 'sheerun/vim-polyglot'
	" File Explorer
	Plug 'scrooloose/NERDTree'
	" Auto pairs for '(' '[' '{'
	Plug 'jiangmiao/auto-pairs'

call plug#end()
```

## Now source the plugins<br />

+ Add this line to "init.vim" <br />
```
source $HOME/.config/nvim/vim-plug/plugins.vim
```
