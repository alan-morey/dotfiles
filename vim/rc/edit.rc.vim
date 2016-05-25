set smarttab " Indent "shfitwidth" spced when <Tab> key pressed at front of line
set expandtab " Insert spaces for TAB
set tabstop=4 " How many colums a TAB counts for
set shiftwidth=4 " What happens when you indent with >>, << or ==
set softtabstop=4 " Number of spaces inserted when TAB is pressed
set autoindent smartindent
set scrolljump=5 " Jump 5 lins when out of the screen
set scrolloff=5 " Indicate jump out of the screen when 3 lines before end of screen
set sidescrolloff=5

set backspace=indent,eol,start " Backspace can delete anything, including \n, in insert mode
set showmatch " When inserting a bracket, brefly jump to its match
set matchpairs+=<:> " Highlight <>

set hidden " Allow switch buffer when current is not saved

" Folding {{{

set foldenable " Enable folding
set foldmethod=marker " Folding type
set foldcolumn=2 " Fold Column

" }}}
