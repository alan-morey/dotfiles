set nocompatible " Turn off vi compatibility
let mapleader = "\<Space>"

if has('win32') || has('win64')
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

source ~/.vim/bundles.vim

" General {{{
set fileencodings=utf-8,iso-8859-1

set mouse=a       " Automatically enable mouse usage
set mousehide     " Hide mouse while typing

set viewoptions=folds,options,cursor,unix,slash " Better Unix/Windows compatibility

set guioptions-=T " Remove toolbar
set guioptions-=m " Remove menu bar
set guioptions-=e " Non-GUI tabs for showtabline
set guioptions-=r " No right scrollbar
set guioptions-=l " No left scrollbar
set guioptions-=L " No left scrollbar, when vert split
set guioptions+=c " Console dialogs

set lines=40
set columns=120
      
set hidden

set undodir=~/.vim/undodir
set undofile

" }}}
" Searching {{{

set hlsearch " Highlight search
set incsearch " Show match for partly typed search
set ignorecase " Ignore case when searching
set smartcase " Override ignorecase when search has uppercase characters

" }}}
" Displaying Text {{{


set nowrap " Dont wrap long lines
set showbreak=...
set nolist " Dont' display unprintable characters
set listchars=tab:\ ·,eol:¬,trail:·,extends:»,precedes:«
set linebreak " Wrap on words
set tabstop=4 " How many colums a TAB counts for
set shiftwidth=4 " What happens when you indent with >>, << or ==
set softtabstop=4 " Number of spaces inserted when TAB is pressed
set smarttab " Indent "shfitwidth" spced when <Tab> key pressed at front of line
set expandtab " Insert spaces for TAB
set autoindent
set scrolljump=5 " Jump 5 lins when out of the screen
set scrolloff=5 " Indicate jump out of the screen when 3 lines before end of screen
set sidescrolloff=5

if has("gui_running")
  set number " Show line number for each line if GUI 
  set showtabline=2 " Always show tabline if GUI

  if has("gui_macvim")
    set guifont=Ubuntu\ Mono\ derivative\ Powerline:h18
  else
    set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 13
  endif
endif

" }}}
" Syntax and Highlighting {{{

" Enable highlighting if color terminal or GUI
if &t_Co > 2 || has("gui_running")
  set background=dark
  if !has("gui_running")
    let base16colorspace=256
  endif

  colorscheme base16-eighties
endif

set cursorline
set colorcolumn=80

" }}}
" Status & Command Line {{{

set ruler " Show cursor position in status line

set history=750 " Store cmdline history

set laststatus=2 " Always display status line

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


set showmode " Show mode in status line
set showcmd " Show incomplete commands 
set wildmenu
set wildmode=list,full

" }}}
" Editing Text {{{

set backspace=indent,eol,start " Backspace can delete anything, including \n, in insert mode
set showmatch " When inserting a bracket, brefly jump to its match

" }}}
" Folding {{{

set foldenable " Enable folding
set foldmethod=marker " Folding type
set foldcolumn=2 " Fold Column

" }}}
" Mappings {{{
nnoremap <Space> <nop>

nnoremap Q gq " Format lines
nnoremap Y y$ " Yank to end of line
nmap <silent> <F11> :exec &nu==&rnu? "se nu!" : "se rnu!"<CR> " Toggle line numbering mode
map <silent> <F12> :set list!<CR> " Toggle Unprintable character listing

" Disable Arrow keys to use proper vim navigation
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk


" Make CTRL+L clear hightlight as well as redraw
noremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>


imap jk <ESC> " Generate Escape, to get back to Normal Mode

nnoremap <leader>rs :source ~/.vimrc<CR>
nnoremap <leader>re :e ~/.vim/vimrc.vim<CR>
nnoremap <leader>rd :e ~/.vim/<CR>

" Save file easily
nnoremap <leader>w :w<CR>

" Copy & patest to system clipboard easily
vmap <leader>y "+y
vmap <leader>d "+d
vmap <leader>p "+p
vmap <leader>P "+P
nmap <leader>p "+p
nmap <leader>P "+P

nmap <leader>ne :NERDTreeToggle<CR>

" }}}
" Filtypes {{{

set fileformats=unix,mac,dos " Treat all files as unix(\n)

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
