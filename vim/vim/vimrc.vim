" -----------------------------------------------------------
" Vim Config
" Alan Morey <morey.alan@gmail.com>
" Version 2.0
" 
" Inspired by:
" https://github.com/gmarik/vimfiles/blob/master/vimrc
" https://github.com/gabebw/dotfiles
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
" https://github.com/akitaonrails/vimfiles
" http://leetless.de/vimrc.txt
" https://github.com/oryband/dotvim/blob/master/vimrc
" -----------------------------------------------------------
" Turn off vi compatibility
set nocompatible

filetype off

set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle "gmarik/vundle"

" Color Scheme
Bundle "nanotech/jellybeans.vim"

Bundle 'vim-ruby/vim-ruby'
Bundle 'scrooloose/syntastic'
Bundle 'ejholmes/vim-forcedotcom'


" General {{{

set fileencodings=utf-8,iso-8859-1
" Set color scheme
colorscheme jellybeans

" Remove toolbar
set guioptions-=T

set hidden

set undodir=~/.vim/undodir
set undofile

" }}}
" Searching {{{

" Highlight search
set hlsearch

" Show match for partly typed search
set incsearch

" Ignore case when searching
set ignorecase

" Override ignorecase when search has uppercase characters
set smartcase

" }}}
" Displaying Text {{{

" Dont wrap long lines
set nowrap

set showbreak=...

" Dont' display unprintable characters
set nolist
set listchars=tab:\ ·,eol:¬,trail:·,extends:»,precedes:«


" Wrap on words
set linebreak

" How many colums a TAB counts for
set tabstop=4

" What happens when you indent with >>, << or ==
set shiftwidth=4

" Indent "shfitwidth" spced when <Tab> key pressed at front of line
set smarttab

" Number of spaces inserted when TAB is pressed
set softtabstop=4

" Insert spaces for TAB
set expandtab

set autoindent

" Jump 5 lins when out of the screen
set scrolljump=5

" Indicate jump out of the screen when 3 lines before end of screen
set scrolloff=5

if has("gui_running")
  " Show line number for each line if GUI
  set number
 
  " Always show tabline if GUI
  set showtabline=2

  " Set font Courier New, Bold, Size 11
"  set guifont=Courier_New:h11:b:cANSI
endif

" }}}
" Syntax and Highlighting {{{

" Enable highlighting if color terminal or GUI
if &t_Co > 2 || has("gui_running")
  syntax on
endif

set cursorline

set colorcolumn=80

" }}}
" Status & Command Line {{{
" Show cursor position in status line
set ruler

" Store cmdline history
set history=750

" Always display status line
set laststatus=2

let g:syntastic_enable_signs=1
let g:systastic_auto_jump=1
let g:syntastic_stl_format='[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'

" Status line format
set statusline=%<%f\ (%n)%(\ [%W%H%M%R%Y]%)%=%([%b,0x%B]%)\ %-14.(%l,%c%V%)\ %P
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


" Show mode in status line
set showmode

" Show incomplete commands 
set showcmd

set wildmenu

set wildmode=list:full

" }}}
" Editing Text {{{

" Backspace can delete anything, including \n, in insert mode
set backspace=indent,eol,start

" When inserting a bracket, brefly jump to its match
set showmatch

" }}}
" Folding {{{

" Enable folding
set foldenable

" Folding type
set foldmethod=marker

" Fold Column
set foldcolumn=2

" }}}
" Win32 {{{

if has("win32")
  source $VIMRUNTIME/mswin.vim
  behave mswin
endif

" }}}
" Mappings {{{

let mapleader=","

" Make CTRL+L clear hightlight as well as rediraw
noremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

" Format lines
nnoremap Q gq

" Yank to end of line
nnoremap Y y$

" Toggle line numbering mode
nmap <silent> <F11> :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>

" Toggle Unprintable character listing
map <silent> <F12> :set list!<CR>


" Disable Arrow keys to use proper vim navigation
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

nnoremap <leader>rs :source ~/.vimrc<CR>
nnoremap <leader>rt :tabnew ~/.vim/vimrc.vim<CR>
nnoremap <leader>re :e ~/.vim/vimrc.vim<CR>
nnoremap <leader>rd :e ~/.vim/<CR>

" }}}
" Filtypes {{{

" Treat all files as unix(\n)
set fileformats=unix,mac,dos

filetype plugin on
filetype indent on

" Necessary for multiple encodings
set encoding=utf-8


" Always change the current directory to that of file
" currently being edited
function CHANGE_CURR_DIR()
  let _dir = expand("%:p:h")
  exec "cd " . _dir
  unlet _dir
endfunction 

autocmd BufEnter * call CHANGE_CURR_DIR()

" }}}
" {{{ Auto Commands
if has("autocmd")
  autocmd BufNewFile,BufRead *.txt setfiletype text

  " Enable soft-wrapping for text files
  autocmd FileType text setlocal wrap


  " Jump to last known cursor postion
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
endif
" }}}
