
""" java
"java annonymous classes.  Sometimes, you have to use them.
"set cinoptions+=j1

" autocmd BufRead *.java set makeprg=ant\ -f\ /home/demian/code/jim/build.xml
autocmd BufRead *.java set autoindent shiftwidth=4 smartindent makeprg=ant
autocmd BufRead *.java set errorformat=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
autocmd BufRead,BufNewFile *.java map <silent> <F6> :!ant<CR>
"shell command for generating system java tags,
"!ctags -R --extra=+q -f $HOME/.tags/javatags /disk2/wengcj/src/java <CR>
" generating local java tags
autocmd BufRead,BufNewFile *.java map <F12> :!ctags -R --extra=+q -f $PWD/tags $PWD/src/java<CR>
autocmd BufRead,BufNewFile *.java set tags=./tags,tags,$HOME/.tags/javatags
""" end java
