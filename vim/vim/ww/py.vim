
""" python

"autocmd BufRead,BufNewFile *.py set shiftwidth=2 tabstop=2 softtabstop=2 expandtab autoindent smartindent
"autocmd BufRead,BufNewFile *.py set keywordprg=pydoc
"autocmd BufRead,BufNewFile *.py map K :!pydoc {keyword}
"highlight BadWhitSpace ctermbg=red guibg=red
"autocmd BufRead,BufNewFile *.py,*.pyw match BadWhitSpace /^\t\+/
"autocmd BufRead,BufNewFile *.py,*.pyw set textwidth=79
autocmd BufNewFile *.py
  \ call setline(1, '#!/usr/bin/env python') |
  \ call setline(2, '# coding=utf-8' ) |
  \ call setline(3, '#') |
  \ call setline(4, '# Author : wengcijie@kuaishou.com') |
  \ call setline(5, '# Created: ' . strftime('%Y %b %d %a %X %Z')) |
  \ call setline(6, '') |
  \ call setline(7, '') |
  \ call setline(8, '') |
  \ call setline(9, 'if __name__=="__main__":') |
  \ call setline(10, '') |
  \ exec "normal G"
"""autocmd BufWrite *.py :%s/# Last Modified : \(.*\)$/\="# Last Modified : ".strftime("%Y %b %d %a %X %Z")/
autocmd BufNewFile *.py,*.pyw set fileformat=unix
"autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
"remove trailing whitespace when save
"autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
" 自动执行当前buffer的文件名，python %
autocmd BufRead,BufNewFile *.py nnoremap <F5> :w<CR> :!python % <CR>
""" Python end
