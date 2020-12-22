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
## TBH just copy nvim folder from .config and paste it in and also install plug
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
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " For Intellisense COC Stable version of coc
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " For status line in vim 
    Plug 'vim-airline/vim-airline'
    " For installing themes for airline
    Plug 'vim-airline/vim-airline-themes'
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
set ruler              			        " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set iskeyword+=-                      	" treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=4                           " Insert 2 spaces for a tab
set shiftwidth=4                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=0                        " Always display the status line
set number                              " Line numbers
set nocursorline                        " Disable highlighting of the current line
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
" To close certain buffers use :bd 
" To delete certain buffers use :bw by delete we I mean literally delete
```
+ In *init.vim* paste this to source the general settings
```
source $HOME/.config/nvim/general/settings.vim
```
+ To toggle word wrapping use ```:set nowrap``` & ```:set wrap```
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

# Installing coc for intellisense
## Installing and configuring coc
+ Create a directory plug-config
```
mkdir ~/.config/nvim/plug-config

touch ~/.config/nvim/plug-config/coc.vim
```
+ paste the coc-config in coc.vim
```
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" NeoVim-only mapping for visual mode scroll
" Useful on signatureHelp after jump placeholder of snippet expansion
if has('nvim')
  vnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#nvim_scroll(1, 1) : "\<C-f>"
  vnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#nvim_scroll(0, 1) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" Explorer
let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   }
\ }

nmap <space>e :CocCommand explorer<CR>
nmap <space>f :CocCommand explorer --preset floating<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
```
+ Source the config
```
source $HOME/.config/nvim/plug-config/coc.vim
```	
+ Checking coc health

You can run ```:checkhealth``` and there should now be an entry for coc</br>
You can use ```g:coc_node_path``` to point to your node executable</br>
You can also run ```:CocInfo``` to get some useful info

+ Install extensions
You can install extensions for languages like this:

```
:CocInstall coc-json coc-python coc-snippets coc-vimlsp coc-clangd coc-explorer
```

+ There are many more extensions to choose from here:

  [coc-extensions](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions)

You can list all of the extension commands with:

```
:CocList commands
```

You can uninstall an extension with:

```
:CocUninstall coc-html
```

You can manage your extensions with:

```
:CocList extensions
```
Hit ```tab``` to see a list of options for each extension

+ Configuration

Run ```:CocConfig``` this will open the file ```~/.config/nvim/coc-settings.json```

here you can add [language servers](https://github.com/neoclide/coc.nvim/wiki/Language-servers)

and other configuration like autoformat and adding a location for snippets
```
{
    "coc.preferences.formatOnSaveFiletypes": [
        "css",
        "markdown",
        "javascript",
        "graphql",
        "html",
        "yaml",
        "json",
        "python"
    ],
    // python config
    "python.linting.enabled": true,
    "python.linting.pylintEnabled": true,
    "snippets.ultisnips.directories": [
        "UltiSnips",
        "~/.config/nvim/utils/snips"
    ],
    "clangd.path": "/home/thecreator-hr/.config/coc/extensions/coc-clangd-data/install/11.0.0/clangd_11.0.0/bin/clangd",
    // explorer
    "explorer.width": 30,
    "explorer.icon.enableNerdfont": true,
    "explorer.previewAction.onHover": false,
    "explorer.keyMappings.global": {
        "<cr>": [
            "expandable?",
            "expand",
            "open"
        ],
        "v": "open:vsplit"
    }
}
```

for more info on configuring your settings checkout [this page](https://github.com/neoclide/coc.nvim/wiki/Using-the-configuration-file)
+ For coc-python to work need to insall jedi
```
sudo pip3 install -U jedi
```
 check jedi install
 ```
 sudo pip3 search jedi
 ```
 Now for function defination and declariation you can press ```gd``` over it to enter to where the function has been defined
 To exit out of there press ```ctrl+o```
 also you can use ```shift+k```

 ## NERD FONT
+ Not yet done

## Airline - Status Line
+ Plugin Airline and Airline themes
  Add the following to ```~/.config/nvim/vim-plug/plugins.vim```

```
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
```
+ Creating config
Create theme file for airline

```
mkdir ~/.config/nvim/themes/
touch ~/.config/nvim/themes/airline.vim
```

Add the following config
```
" enable tabline
let g:airline#extensions#tabline#enabled = 1
" instead of arrow mode of tabs make them rectangle
" let g:airline#extensions#tabline#left_sep = ''
" let g:airline#extensions#tabline#left_alt_sep = ''
" let g:airline#extensions#tabline#right_sep = ''
" let g:airline#extensions#tabline#right_alt_sep = ''

" enable powerline fonts
let g:airline_powerline_fonts = 1
" let g:airline_left_sep = ''
" let g:airline_right_sep = ''

" Switch to your current theme
let g:airline_theme = 'onedark'

" Always show tabs
set showtabline=2

" We don't need to see things like -- INSERT -- anymore
set noshowmode
```
+ Source the files by adding them to init.vim
```
source $HOME/.config/nvim/themes/airline.vim
```
+ Install the Fonts

```
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
```
+ Further documentation and repo
[vim-airliene](https://github.com/vim-airline/vim-airline)  [vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)

# Startify

+ add a start screen to nvim
add this to plug
```
Plug 'mhinz/vim-startify'
```

+ create a config file
```
touch ~/.config/nvim/plug-config/start-screen.vim
```

+ Sessions
```
:SLoad       load a session
:SSave[!]    save a session
:SDelete[!]  delete a session
:SClose      close a session
```

Add ! to skip the prompt

We should specify where we want Startify to keep our sessions 1
```
let g:startify_session_dir = '~/.config/nvim/session'
```

+ Startify Lists

We can specify what shows up in our menu like this:

```
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]
```

+ Bookmarks
```
let g:startify_bookmarks = [
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'z': '~/.zshrc' },
            \ '~/Blog',
            \ '~/Code',
            \ '~/Pics',
            \ ]
```
+ Configuration Options
You can automatically restart a session like this
```
let g:startify_session_autoload = 1
```
 From the docs:

"If this option is enabled and you start Vim in a directory that contains a Session.vim, that session will be loaded automatically. Otherwise it will be shown as the top entry in the Startify buffer."

Let Startify take care of buffers

```
let g:startify_session_delete_buffers = 1
```

+ Similar to Vim-rooter
```
let g:startify_change_to_vcs_root = 1
```
+ If you want Unicode
```
let g:startify_fortune_use_unicode = 1
```
+ Automatically Update Sessions
```
let g:startify_session_persistence = 1
```
+ Get rid of empy buffer and quit
```
let g:startify_enable_special = 0
```

+ Custom Header 
```
let g:startify_custom_header = [
        \ '    ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗',
        \ '    ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║',
        \ '    ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║',
        \ '    ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║',
        \ '    ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║',
        \ '    ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝',
        \]
```

+ Source the file
```
source $HOME/.config/nvim/plug-config/start-screen.vim
```


+ Final file to copy in start-screen.vim 
```
let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]
let g:startify_bookmarks = [
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'z': '~/.zshrc' },
            \ '~/Blog',
            \ '~/Code',
            \ '~/Pics',
            \ ]
let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1
let g:startify_enable_special = 0
let g:startify_custom_header = [
        \ '    ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗',
        \ '    ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║',
        \ '    ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║',
        \ '    ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║',
        \ '    ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║',
        \ '    ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝',
        \]
```
# Ranger for file exploration 

+ install Ranger no need if on windows
```
sudo apt install ranger
```

+ Install Ranger devicons(You can now add default_linemode devicons to your rc.conf)

```
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
```

+ Install Ueberzug (Linux only) </br>
Unfortunately Ueberzug only supports linux at the moment as far as I know

    Ubuntu (Note you may experience your images being badly placed this is because pip doesn't have the newest version of ueberzug, if you find this issue please install from source)

```
pip install ueberzug
```

+ Ranger config file
make sure you create a ranger config file and at least add the following lines
Add the following file:

```
mkdir ~/.config/ranger

touch ~/.config/ranger/rc.conf
```
+ Add the following to rc.conf
```
set preview_images_method ueberzug

default_linemode devicons

set show_hidden true
```

+ Add the plugin
```
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
```

+ Add some config to ```~/.config/nvim/plug-config/rnvimr.vim```
```
touch ~/.config/nvim/plug-config/rnvimr.vim
```

+ Add the following to rnvimr.vim

```
" Make Ranger replace netrw and be the file explorer
let g:rnvimr_ex_enable = 1

nmap <space>r :RnvimrToggle<CR>
```
+ source the file
```
source $HOME/.config/nvim/plug-config/rnvimr.vim
```

+ sync ranger config
```
:RnvimrSync
```
+ [Alternative](https://github.com/francoiscabrol/ranger.vim)

# GIT Integration

+ We will use signify
```
touch ~/.config/nvim/plug-config/signify.vim
```
+ add this to the plugin manager
```
Plug 'mhinz/vim-signify'
```
+ Source this file
```
source $HOME/.config/nvim/plug-config/signify.vim
```

+ Configure Signify

Signify will show added, modified, or removed lines

From the documentation:
```
SIGNS                                                            *signify-signs*

    `+`     This line was added.

    `!`     This line was modified.

    `_1`    The number of deleted lines below this sign. If the number is larger
    `99`    than 9, the `_` will be omitted. For numbers larger than 99, `_>`
    `_>`    will be shown instead.

    `!1`    This line was modified and the lines below were deleted.
    `!>`    It is a combination of `!` and `_`. If the number is larger than 9,
          `!>` will be shown instead.

    `‾`     The first line was removed. It's a special case of the `_` sign.

See |g:signify_sign_add| on how to use different signs.
```
+ You can also stage and unstage hunks

Here's some config for changing the buffer signs

```
" Change these if you want
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'

" I find the numbers disctracting
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1


" Jump though hunks
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
nmap <leader>gJ 9999<leader>gJ
nmap <leader>gK 9999<leader>gk


" If you like colors instead
" highlight SignifySignAdd                  ctermbg=green                guibg=#00ff00
" highlight SignifySignDelete ctermfg=black ctermbg=red    guifg=#ffffff guibg=#ff0000
" highlight SignifySignChange ctermfg=black ctermbg=yellow guifg=#000000 guibg=#ffff00
```
+ Commands

```
:SignifyToggle
:SignifyToggleHighlight
```
+ There are more commands but I prefer the options fugitive and gv provide

# Fugitive/Grubarb

+ add this to plug
```
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
```
+ This plugin is what we'll use for interacting with git
```
Note GBrowse only works when Rhubarb is installed

Note Make sure you are using git through ssh not http
```

+ Commands
```
:Git add

:Git commit

:Git push

:Git pull

:Git diff

:Git log

:Git blame

Gdiffsplit

GRemove

GBrowse
```

+ GV
Commands

From the readme: "A git commit browser."

To open commit browser:

```
:GV
```
You can pass git log options to the command, e.g. :GV -S foobar.</br>
+ Other options
```
:GV!         # will only list commits that affected the current file
:GV?         # fills the location list with the revisions of the current file
:GV          # or :GV? can be used in visual mode to track the changes in the selected lines.
```

+ Mappings
```
Mappings

    o or on a commit to display the content of it
    o or on commits to display the diff in the range
    O opens a new tab instead
    gb for :Gbrowse
    ]] and [[ to move between commits
    . to start command-line with :Git [CURSOR] SHA à la fugitive
    q or gq to close
```

+ check repos [signify](https://github.com/mhinz/vim-signify) [fugitive](https://github.com/tpope/vim-fugitive) [rhubarb](https://github.com/tpope/vim-rhubarb) [gv](https://github.com/junegunn/gv.vim)

# VIM Which Key

+ To guide what the different keys do
```
Plug 'liuchengxu/vim-which-key'
```
+ Create config file
```
touch ~/.config/nvim/keys/which-key.vim
```
+ Source
```
source $HOME/.config/nvim/keys/which-key.vim
```
+ Which Key

From the github repo:

```"vim-which-key is vim port of emacs-which-key that displays available keybindings in popup."```

+ Configure Which Key
```
" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100


" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Single mappings
let g:which_key_map['/'] = [ '<Plug>NERDCommenterToggle'  , 'comment' ]
let g:which_key_map['e'] = [ ':CocCommand explorer'       , 'explorer' ]
let g:which_key_map['f'] = [ ':Files'                     , 'search files' ]
let g:which_key_map['h'] = [ '<C-W>s'                     , 'split below']
let g:which_key_map['r'] = [ ':Ranger'                    , 'ranger' ]
let g:which_key_map['S'] = [ ':Startify'                  , 'start screen' ]
let g:which_key_map['T'] = [ ':Rg'                        , 'search text' ]
let g:which_key_map['v'] = [ '<C-W>v'                     , 'split right']
let g:which_key_map['z'] = [ 'Goyo'                       , 'zen' ]

" s is for search
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'     , 'history'],
      \ ';' : [':Commands'     , 'commands'],
      \ 'a' : [':Ag'           , 'text Ag'],
      \ 'b' : [':BLines'       , 'current buffer'],
      \ 'B' : [':Buffers'      , 'open buffers'],
      \ 'c' : [':Commits'      , 'commits'],
      \ 'C' : [':BCommits'     , 'buffer commits'],
      \ 'f' : [':Files'        , 'files'],
      \ 'g' : [':GFiles'       , 'git files'],
      \ 'G' : [':GFiles?'      , 'modified git files'],
      \ 'h' : [':History'      , 'file history'],
      \ 'H' : [':History:'     , 'command history'],
      \ 'l' : [':Lines'        , 'lines'] ,
      \ 'm' : [':Marks'        , 'marks'] ,
      \ 'M' : [':Maps'         , 'normal maps'] ,
      \ 'p' : [':Helptags'     , 'help tags'] ,
      \ 'P' : [':Tags'         , 'project tags'],
      \ 's' : [':Snippets'     , 'snippets'],
      \ 'S' : [':Colors'       , 'color schemes'],
      \ 't' : [':Rg'           , 'text Rg'],
      \ 'T' : [':BTags'        , 'buffer tags'],
      \ 'w' : [':Windows'      , 'search windows'],
      \ 'y' : [':Filetypes'    , 'file types'],
      \ 'z' : [':FZF'          , 'FZF'],
      \ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")
```
# Snippets

+ snippets
```
Plug 'honza/vim-snippets'
```

+ make a souce file
```
touch ~/.config/nvim/plug-config/snippets-collection.vim
```
+ add the configuration to source file
```
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
```

+ now source the file in init.vim
```
source $HOME/.config/nvim/plug-config/snippets-collection.vim
```
+ Add your own snippets

Edit coc-settings.json and add the following
```
"snippets.userSnippetsDirectory": "~/.config/nvim/snips",
```
+ After that you can add a file like this:
```
mkdir ~/.config/nvim/snips
```
+ Now to make a file that contains the snippets 
```
touch ~/.config/nvim/snips/{fileformat}.snippets
```
+ Commands

You'll be able to notice it's a snippet from the ~ character

Auto complete should feel very familiar, refer to the earlier bindings you set.

To list all snippets for a current file:
```
:CocList snippets

:CocCommand snippets.editSnippets

:CocCommand snippets.openSnippetFiles
```
