" Install vim-plug
if empty(glob('~/.vim/autoload/plug.vim')) 
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source ~/.vim/init.vim
endif

call plug#begin()

" Color Scheme
Plug 'chriskempson/base16-vim'

Plug 'DavidEGx/ctrlp-smarttabs'
Plug 'Lokaltog/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'ejholmes/vim-forcedotcom'
Plug 'fatih/vim-go'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-peekaboo'
Plug 'mbbill/undotree'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/PreserveNoEOL'
Plug 'will133/vim-dirdiff'

call plug#end()

" FIXME move somewhere more appropriate
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif 

" CtrlP
let g:ctrlp_use_caching = 0 " Disable caching because ag is fast
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  " Fallback to git ls-files for fast list when ag not available
  let g:ctrlp_user_command = ['.git',
    \ 'cd %s && git ls-files . -co --exclude-standard'
    \ 'find %s -type f']
endif
let g:ctrlp_extensions = ['smarttabs']


" EasyAlign
" Start interacive EasyAlign for a motion/text object(e.g. gaip)
nmap ga <Plug>(EasyAlign)
" Start interacive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

