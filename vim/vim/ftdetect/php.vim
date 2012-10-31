if has("autocmd")
  " Treat following file types as php
  autocmd BufRead,BufNewFile *.tpl,*.inc,*.phpw,*.phtml set filetype=php
endif
