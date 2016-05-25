set nolist " Dont' display unprintable characters
set listchars=tab:\ ·,eol:¬,trail:·,extends:»,precedes:«

set linebreak " Wrap on words
set showbreak=...
set nowrap " Dont wrap long lines

if has("gui_running")
  set number " Show line number for each line if GUI 
  set showtabline=2 " Always show tabline if GUI

  if has("gui_macvim")
    set guifont=Ubuntu\ Mono\ derivative\ Powerline:h18
  else
    set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 13
  endif
endif


" Enable highlighting if color terminal or GUI
if &t_Co > 2 || has("gui_running")
  set background=dark
  if !has("gui_running")
    let base16colorspace=256
  endif

  try
      colorscheme base16-eighties
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme desert
  endtry
endif

set cursorline " Highlight line cursor is on
set colorcolumn=80,120 " Highlight colums


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
set wildmode=list:longest,full

set splitbelow " Split window below current
set splitright " Split widow to right of current