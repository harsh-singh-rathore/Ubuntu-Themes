"#############################################################################
"
" My rather basic
" __      ___                    
" \ \    / (_)                   
"  \ \  / / _ _ __ ___  _ __ ___ 
"   \ \/ / | | '_ ` _ \| '__/ __|
"    \  /  | | | | | | | | | (__ 
"     \/   |_|_| |_| |_|_|  \___|
"
"#############################################################################


" Plugins (Call PlugInstall after making changes here)
"-----------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'               " Shows project structure
Plug 'tpope/vim-fugitive'               " Git integration
Plug 'mbbill/undotree'                  " Gives a file changes tree
Plug 'itchyny/lightline.vim'            " Status line plugin

Plug 'HerringtonDarkholme/yats.vim'

Plug 'jiangmiao/auto-pairs'
Plug 'vim-syntastic/syntastic'

Plug 'Valloric/YouCompleteMe'
" Plug 'dense-analysis/ale'
Plug 'dracula/vim'

" Plugin to have snippets for different languages
call plug#end()

" To enable YouCompleteMe go to .vim/plugged/youcompleteme 
" and do ./install.py


" Vim settings
"-----------------------------------------------------------------------------

syntax on                               " For syntax highlighting

" Copy the monokai.vim file from https://github.com/crusoexia/vim-monokai
" into ~/.vim/colors/monokai.vim
colorscheme dracula                     " Set colorscheme from here
" set termguicolors                     " Sets 256 bit color
                                        " No comment in the following line (?)
hi Normal guibg=NONE ctermbg=NONE       
                                        " Makes background same as terminal
set noerrorbells                        " No sounds on errors
set tabstop=4 softtabstop=4 expandtab   " Sets tabs's width
set shiftwidth=4                        " Shifts 4 spaces (Indenting)(V + >)
set smartindent                         " Auto indents from indented line
set nu                                  " Shows line numbers
set number relativenumber               " Gives linenumbers relatively
set nowrap                              " Doesn't wrap text
set ignorecase                          " Disables case sensitive search
set smartcase                           " Enables case sensitive search on caps
set noswapfile                          " Disables swapfiles
set nobackup                            " Disables backups (undodir is set)
set undodir=~/.vim/undodir              " Sets undodir (make this dir)
set undofile                            " Sets undofiles for every file
set incsearch                           " Enables incremental search
set hlsearch                            " Enables highlights for searches
set path+=**                            " Allows vim to look through files
set splitbelow splitright               " Set default split to right

filetype plugin on
set omnifunc=syntaxcomplete#Complete

set backspace=indent,eol,start          " Mac specific to make delete key work

" Plugin settings
"-----------------------------------------------------------------------------

" Both of these seem to not be working
let g:NERDTree_banner=0                 " Disables NERDTree banner
let g:NERDTree_WinSize=1                " Sets NERDTree window size as %

let g:airline#extensions#ale#enabled = 1



" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0
 
" let g:syntastic_python_python_exec = '/usr/bin/python3'
" let g:syntastic_python_checkers = ['pylint']

" Status line
"-----------------------------------------------------------------------------

set laststatus=2                        " Enables statusline
set noshowmode                          " Disables mode show in command line
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }


" Remaps
"-----------------------------------------------------------------------------

let mapleader = " "                     " Sets <leader> key

" => Open terminal inside Vim
map <Leader>tt :bel vert term<CR>

" Normal mode key to jjj so no need to go to the Esc
:imap jjj <Esc>
" Jump between splits with Ctrl+(hjkl)
nnoremap <C-h> <C-w>h<CR>               
nnoremap <C-j> <C-w>j<CR>
nnoremap <C-k> <C-w>k<CR>
nnoremap <C-l> <C-w>l<CR>

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
" For vert to horiz leader+t+k
" For horiz to vert leader+t+h
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

" Jump between tabs with <leader>+(np)
nnoremap <leader>n :tabn<CR> 
nnoremap <leader>p :tabp<CR>

" Toggles NERDTree with <leader>+t (adding vertical resize here)
nnoremap <C-f> :NERDTreeToggle .<CR> :vertical res -10<CR>

" Toggles Undotree with Ctrl+Z
nnoremap <C-z> :UndotreeToggle<CR>

" Open vertical split with Ctrl+c
nnoremap <C-c> <C-w>v<CR>
" Close current buffer with Ctrl+x
nnoremap <C-x> :q<CR>

" Save file with Ctrl+s
nnoremap <C-s> :retab<CR>:w<CR>
imap <C-s> <Esc>:retab<CR>:w<CR>

" Removes all highlights with <esc><esc>
nnoremap <esc><esc> :let @/=""<CR>
