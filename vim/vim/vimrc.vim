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


if has('win32') || has('win64')
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif


" Bundles {{{

if !isdirectory(expand("~/.vim/bundle/vundle/.git"))
  !git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
endif

filetype off
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle "gmarik/vundle"

" Color Scheme
Bundle "tomasr/molokai"
Bundle "altercation/vim-colors-solarized"
Bundle "chriskempson/base16-vim"

Bundle "tpope/vim-fugitive"
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle "bling/vim-airline"
Bundle 'Lokaltog/vim-easymotion'
Bundle 'mbbill/undotree'

" }}}

" General {{{
set fileencodings=utf-8,iso-8859-1

set mouse=a       " Automatically enable mouse usage
set mousehide     " Hide mouse while typing

set viewoptions=folds,options,cursor,unix,slash " Better Unix/Windows compatibility

"Remove toolbar
set guioptions-=T
set guioptions-=m
set guioptions-=e
set guioptions-=r
set guioptions-=l

set lines=40
set columns=120
      
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

set sidescrolloff=5

if has("gui_running")
  " Show line number for each line if GUI
  set number
 
  " Always show tabline if GUI
  set showtabline=2

  " Set font Courier New, Bold, Size 11
  set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 13
endif

" }}}
" Syntax and Highlighting {{{

" Enable highlighting if color terminal or GUI
if &t_Co > 2 || has("gui_running")
  syntax on
  set background=dark
  if !has("gui_running")
    let g:solarized_termcolors = 256 
    let base16colorspace=256
"    set background=light
  endif

  colorscheme base16-eighties
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
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Status line format
"set statusline=%<%f\    " Filename
"set statusline=(%n)%(\ [%W%H%M%R%Y]%)%=%([%b,0x%B]%)\ %-14.(%l,%c%V%)\ %P
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*


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
" Mappings {{{

nnoremap <Space> <nop>
let mapleader="\<Space>"

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
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
noremap <right> <nop>
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


" Always switch to the current file directory
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9]*://" | lcd %:p:h | endif

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

let NERDTreeQuitOnOpen=1
