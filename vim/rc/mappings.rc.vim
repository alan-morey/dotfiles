nnoremap Q gq " Format lines
nnoremap Y y$ " Yank to end of line
nmap <silent> <F11> :exec &nu==&rnu? "se nu!" : "se rnu!"<CR> " Toggle line numbering mode
map <silent> <F12> :set list!<CR> " Toggle Unprintable character listing


" Open commandline window instead of commandline
nnoremap : q:i
nnoremap / q/i
nnoremap ? q?i

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

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Clear search highlighting and/or redraw screen
nnoremap <leader><ESC> :nohlsearch \| :redraw!<CR>

" Generate Escape, to get back to Normal Mode
imap jk <ESC>

" Leave default leader key mapping and bind <Space> to <leader> in addition
map <SPACE> <leader>

" Save file easily
nnoremap <leader>w :w<CR>

" Copy to system clipboard
nmap <leader>ya gg"+yG``
vmap <leader>y "+y

" Cut to system clipboard
vmap <leader>d "+d

" Paste from system clipboard
vmap <leader>p "+p
vmap <leader>P "+P
nmap <leader>p "+p
nmap <leader>P "+P

" Paste from system clipboard - Replace All
vmap <leader>pa ggdG"+p 
nmap <leader>pa ggdG"+p

nmap <leader>ne :NERDTreeFocus<CR>
nmap <leader>nc :NERDTreeClose<CR>
nmap <leader>nf :NERDTreeFind<CR>
