
""" shell
"autocmd BufRead,BufNewFile *.sh set shiftwidth=2 tabstop=2 softtabstop=2 expandtab autoindent smartindent
autocmd BufNewFile *.sh
  \ call setline(1, '#!/bin/bash') |
  \ call setline(2, '#' ) |
  \ call setline(3, '#') |
  \ call setline(4, '# Author : ' . WW_META_EMAIL) |
  \ call setline(5, '# Created: ' . strftime('%Y %b %d %a %X %Z')) |
  \ call setline(6, '') |
  \ call setline(7, '') |
  \ call setline(8, '') |
  \ call setline(9, '') |
  \ call setline(10, '') |
  \ exec "normal G"
autocmd BufNewFile *.sh set fileformat=unix
"autocmd BufRead,BufNewFile *.sh map <silent> <F5> :!bash %<CR>
autocmd BufRead,BufNewFile *.sh ab usage function usage()<CR>{<CR>}
""" shell end
