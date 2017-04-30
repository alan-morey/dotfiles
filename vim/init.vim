if &compatible
  set nocompatible
endif

function! s:source_rc(path)
  let l:rc_file = resolve(expand('~/.vim/rc/' . a:path))

  execute 'source' . fnameescape(l:rc_file)
endfunction

call s:source_rc('init.rc.vim')
call s:source_rc('plugins.rc.vim')
call s:source_rc('search.rc.vim')
call s:source_rc('mappings.rc.vim')
call s:source_rc('view.rc.vim')
call s:source_rc('edit.rc.vim')
call s:source_rc('gui.rc.vim')

" Filtypes {{{

set fileformats=unix,mac,dos " Treat all files as unix(\n)

" Necessary for multiple encodings
set encoding=utf-8


" Always switch to the current file directory
"autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9]*://" | lcd %:p:h | endif

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
