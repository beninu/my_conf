""" c
set shiftwidth=2
set softtabstop=2
set tabstop=2
set smarttab
set expandtab

autocmd BufNewFile *.c,*.cpp,*.cxx,*.cc,*.C
  \ call setline(1, '/*') |
  \ call setline(2, ' * Copyright (c) ' . strftime('%Y') . ', ' . WW_META_CORP) |
  \ call setline(3, ' * All rights reserved.') |
  \ call setline(4, ' *') |
  \ call setline(5, ' * @file ' . expand("%:t")) |
  \ call setline(6, ' * @brief')  |
  \ call setline(7, ' *') |
  \ call setline(8, ' * @author ' . WW_META_EMAIL)|
  \ call setline(9, ' * @date ' . strftime('%Y-%m-%d')) |
  \ call setline(10, ' */') |
  \ call setline(11, '') |
  \ exec "normal G"

autocmd BufNewFile *.h,*.hpp,*.xh,*.hh,*.hxx
  \ let  guard = substitute(expand("%"), "[/.]", "_", "g")  |
  \ let  guard = toupper(guard)  |
  \ call setline(1, '/*') |
  \ call setline(2, ' * Copyright (c) 2014, ' . WW_META_CORP ) |
  \ call setline(3, ' * All rights reserved.') |
  \ call setline(4, ' *') |
  \ call setline(5, ' * @file ' . expand("%:t")) |
  \ call setline(6, ' * @brief')  |
  \ call setline(7, ' *') |
  \ call setline(8, ' * @author ' . WW_META_EMAIL) |
  \ call setline(9, ' * @date ' . strftime('%Y-%m-%d')) |
  \ call setline(10, ' */') |
  \ call setline(11, '') |
  \ call setline(12, '#ifndef  _' . guard ) |
  \ call setline(13, '#define  _' . guard ) |
  \ call setline(14, '#endif  // _' . guard ) |
  \ call setline(15, '') |
  \ exec "normal G"
""" end c

""" c++
""" end c++

""" c,c++
autocmd BufRead,BufNewFile *.c,*.h,*.xh,*.hh,*.hxx,*.cpp,*.cxx,*.cc,*.C,*.hpp abbr #d #define
autocmd BufRead,BufNewFile *.c,*.h,*.xh,*.hh,*.hxx,*.cpp,*.cxx,*.cc,*.C,*.hpp abbr #i #include
autocmd BufRead,BufNewFile *.c,*.h,*.xh,*.hh,*.hxx,*.cpp,*.cxx,*.cc,*.C,*.hpp abbr #b /*******************************
autocmd BufRead,BufNewFile *.c,*.h,*.xh,*.hh,*.hxx,*.cpp,*.cxx,*.cc,*.C,*.hpp abbr #e *******************************/
"ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --exclude=.svn -f $HOME/.tags/ctags /disk2/wengcj/src/c
autocmd BufRead,BufNewFile *.c,*.h,*.xh,*.hh,*.hxx,*.cpp,*.cxx,*.cc,*.C,*.hpp map <F6> :wa<CR>:make<CR>
autocmd BufRead,BufNewFile *.c,*.h,*.xh,*.hh,*.hxx,*.cpp,*.cxx,*.cc,*.C,*.hpp set tags=tags,./tags,../tags,../../tags,$HOME/soft/third-party/tags,$HOME/ws/bzl/msg-libs/tags
autocmd BufRead,BufNewFile *.c,*.h,*.xh,*.hh,*.hxx,*.cpp,*.cxx,*.cc,*.C,*.hpp syntax on

""" c,c++ end

""" 切换header和source
function! SwitchSourceHeader()
  " 这个函数用来切换当前buffer的source和header
  " 比如当前文件是a.c，会去找a.h，并打开它
  " 只在同一文件夹中寻找
  " 目前的对应关系
  "   .c   <-> .h
  "   .cpp <-> .h
  " TODO
  "   .cc  <-> .h
  "   .cxx <-> .h
  "   .C   <-> .h
  " TODO2
  "   找不同文件夹的header和source
  " BTW:
  "   the .hpp仅用于模板header，不应该有相应的cpp
  if (expand ("%:t") == expand ("%:t:r") . ".cpp")
    if (filereadable(expand("%:r").".hpp") != 0)
      find %:t:r.hpp
    elseif (filereadable(expand("%:r").".hh") != 0)
      find %:t:r.hh
    else
      find %:t:r.h
    endif
  elseif (expand ("%:t") == expand ("%:t:r") . ".cc")
    if (filereadable(expand("%:r").".hpp") != 0)
      find %:t:r.hpp
    elseif (filereadable(expand("%:r").".hh") != 0)
      find %:t:r.hh
    else
      find %:t:r.h
    endif
  elseif (expand ("%:t") == expand ("%:t:r") . ".c")
    find %:t:r.h
  elseif (expand ("%:t") == expand ("%:t:r") . ".hpp")
    find %:t:r.cpp
  elseif (expand ("%:t") == expand ("%:t:r") . ".h" || expand ("%:t") == expand ("%:t:r") . ".hh" )
    if (filereadable(expand("%:r").".cpp") != 0)
      find %:t:r.cpp
    elseif (filereadable(expand("%:r").".cc") != 0)
      find %:t:r.cc
    else
      find %:t:r.c
    endif
  endif
endfunction
nmap ,s :call SwitchSourceHeader()<CR>
""" end 切换header和source
