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
	" For Intellisense COC Stable version of coc
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

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
:CocInstall coc-json coc-python coc-snippets coc-vimlsp coc-clangd
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
  "coc.preferences.formatOnSaveFiletypes": ["css", "markdown", "javascript", "graphql", "html", "yaml",  "json", "python"],

  // python config
  "python.linting.enabled": true,
  "python.linting.pylintEnabled": true,

  "snippets.ultisnips.directories":
  [
    "UltiSnips",
    "~/.config/nvim/utils/snips"
  ]

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