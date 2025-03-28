"------------------------------------------------------------------------------
" PATHOGEN INITIALIZATION
"------------------------------------------------------------------------------
" Load Pathogen (plugin manager) so that it can load other plugins in ~/.vim/bundle
execute pathogen#infect()

" Enable filetype-based plugin/indentation
filetype plugin indent on

" Enable Vim syntax highlighting
syntax enable

" Use Python 3 for any Python-based plugins or scripts
let g:pymode_python = 'python3'

"------------------------------------------------------------------------------
" BASIC SETTINGS
"------------------------------------------------------------------------------
" Show partial commands in the bottom bar
set showcmd

"------------------------------------------------------------------------------
" COLOR SETTINGS
"------------------------------------------------------------------------------
" Some color-related variables for various color schemes
let g:solarized_termcolors=256
set t_Co=256
set background=light
let g:bluedrake_256=1

" Use the default color scheme (other options: 'sprinkles', 'lightning', etc.)
colorscheme default

" Example xterm16 color map settings
let xterm16_colormap    = 'softlight'
let xterm16_brightness  = 'high'

"------------------------------------------------------------------------------
" KEY MAPPINGS
"------------------------------------------------------------------------------
" Replace all tabs with spaces and save
map <F6> :%s/\t/  /g<CR>:w<CR>

" Run a Ruby command (placeholder—adjust to your needs)
map <F2> :!ruby 

" Toggle NERDTree with F12
map <F12> :NERDTree<CR>

" Use system clipboard for copy/paste
set clipboard=unnamedplus

" Trim trailing whitespace with F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Disable certain keys in insert mode (e.g., PageUp, PageDown, Home, End)
imap <PageUp> <nop>
imap <PageDown> <nop>
imap <HOME> <nop>
imap <End> <nop>

" Disable the same keys in normal mode
nnoremap <PageUp> <nop>
nnoremap <PageDown> <nop>
nnoremap <HOME> <nop>
nnoremap <End> <nop>

" Make Ctrl+h/j/k/l move between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"------------------------------------------------------------------------------
" INDENTATION & WHITESPACE
"------------------------------------------------------------------------------
" Enable intelligent indentation
set smartindent
set cindent

" Use 4 spaces for a tab
set tabstop=4
set shiftwidth=4
set expandtab

"------------------------------------------------------------------------------
" VUNDLE SETUP REQUIREMENTS
"------------------------------------------------------------------------------
" Ensure Vim isn't running in compatibility mode
set nocompatible

" Add Vundle to the runtime path
set rtp+=~/.vim/bundle/Vundle.vim

" Show line numbers
set number

" Allow mouse usage (useful for NERDTree)
set mouse=a

" Load Pathogen again (redundant if done at the top, but left here if you prefer)
execute pathogen#infect()

"------------------------------------------------------------------------------
" SYNTACTIC (SYNTASTIC) SETTINGS
"------------------------------------------------------------------------------
" https://github.com/scrooloose/syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"------------------------------------------------------------------------------
" VUNDLE PLUGIN MANAGER
"------------------------------------------------------------------------------
call vundle#begin()
  " Core Vundle plugin
  Plugin 'VundleVim/Vundle.vim'
  
  " NERDTree for file navigation
  Plugin 'scrooloose/nerdtree'
  
  " Syntastic for syntax checking
  Plugin 'scrooloose/syntastic'
  
  " Auto-closing delimiters
  Plugin 'Raimondi/delimitMate'
  
  " Save files automatically
  Plugin 'vim-auto-save'
  
  " Airline status bar
  Plugin 'vim-airline/vim-airline'
  
  " Surround text objects easily
  Plugin 'tpope/vim-surround'
  Plugin 'tpope/vim-repeat'
  Plugin 'tpope/vim-rails'
  
  " Tern for JavaScript code introspection
  Plugin 'ternjs/tern_for_vim'
  
  " CtrlP fuzzy finder
  Plugin 'ctrlpvim/ctrlp.vim'
  
  " Silver Searcher integration
  Plugin 'ggreer/the_silver_searcher'
  
  " Lightning color scheme
  Plugin 'wimstefan/Lightning'
call vundle#end()

"------------------------------------------------------------------------------
" SILVER SEARCHER CONFIG
"------------------------------------------------------------------------------
" Use ag (the_silver_searcher) with CtrlP
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0

"------------------------------------------------------------------------------
" HIGHLIGHT 81ST COLUMN
"------------------------------------------------------------------------------
" Color the 81st column to help keep line lengths in check
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

"------------------------------------------------------------------------------
" VISIBLE WHITESPACE
"------------------------------------------------------------------------------
" Make tabs, trailing whitespace, and non-breaking spaces visible
set listchars=tab:»»,trail:·,nbsp:~
set list

"------------------------------------------------------------------------------
" REMAPPING CAPS TERMINAL COMMAND (commented out, for reference)
"------------------------------------------------------------------------------
" xmodmap -e "keycode 9 = Caps_Lock NoSymbol Caps_Lock"  #Esc to act as Caps Lock
" xmodmap -e "keycode 66 = Escape NoSymbol Escape"       #Caps Lock to act as Esc

" Show the ruler in the status line (line/column info)
set ruler

" Let backspace behave normally over indentation, line breaks, etc.
set backspace=eol,start,indent

" Let cursor keys wrap lines
set whichwrap+=<,>,h,l

"------------------------------------------------------------------------------
" VIM-AUTO-SAVE SETTINGS
"------------------------------------------------------------------------------
" Disable auto save by default (set to 1 to enable)
let g:auto_save = 0
let g:auto_save_silent = 0

"------------------------------------------------------------------------------
" AUTOCOMPLETE SETUP
"------------------------------------------------------------------------------
" Built-in OmniFunc settings for various filetypes
set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

set omnifunc=htmlcomplete#CompleteTags
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

set omnifunc=csscomplete#CompleteCSS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

set omnifunc=phpcomplete#CompletePHP
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

"------------------------------------------------------------------------------
" DRAGVISUALS.VIM
"------------------------------------------------------------------------------
" Enable drag-visual block plugin for easy block movement
runtime plugin/dragvisuals.vim

" Keymaps for dragvisuals
vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()

" Remove trailing whitespace after dragging
let g:DVB_TrimWS = 1

"------------------------------------------------------------------------------
" NERDTree SETTINGS
"------------------------------------------------------------------------------
" Allow editing files in buffer
set modifiable

" Auto-change working directory to the file’s location on buffer enter
autocmd BufEnter * lcd %:p:h

"------------------------------------------------------------------------------
" END OF .vimrc
"------------------------------------------------------------------------------
