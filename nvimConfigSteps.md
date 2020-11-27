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
# ------------------------------------------------------------------------------
# Time to install more plugins

## General Settings
+ To include some basics in your config first create a directory called general and a file called *settings.vim*
```
mkdir ~/.config/nvim/general

touch ~/.config/nvim/general/settings.vim
```
+ Now paste the general settings in *~/.config/nvim/general/settings.vim* with a breif explaination
```
" set leader key
let g:mapleader = "\<Space>"

syntax enable                           " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler              			            " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set iskeyword+=-                      	" treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=0                        " Always display the status line
set number                              " Line numbers
set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else
"set autochdir                           " Your working directory will always be the same as your working directory

au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

" You can't stop me
cmap w!! w !sudo tee %
```
+ In *init.vim* paste this to source the general settings
```
source $HOME/.config/nvim/general/settings.vim
```
# ------------------------------------------------------------------------------------------------
# Key Mappings
## Key maps
+ Make another file and directory to store key mappings
```
mkdir ~/.config/nvim/keys

touch ~/.config/nvim/keys/mappings.vim
```
+ Add the following to mappings.vim
```
" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc>

" Easy CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Alternate way to save
nnoremap <C-s> :w<CR>
" Alternate way to quit
nnoremap <C-Q> :wq!<CR>
" Use control-c instead of escape
nnoremap <C-c> <Esc>
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da
```
+ source the files from *init.vim*
```
source $HOME/.config/nvim/keys/mappings.vim
```