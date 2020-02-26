function! NextFile()
  let cur_dir = expand("%:p:h")
  let cur_file = expand("%:p:t")
  echo cur_dir
  echo cur_file
  "*\log\2011\03
  if cur_dir =~ '.*\\log\\\d\{4}\\\d\{2}'
    echo 'match'
    call NextLogFile(cur_dir, cur_file)
  else
    echo 'not match'
    call NextNoteFile(cur_dir, cur_file)
  endif 
endfunction

function! PrevFile()
  let cur_dir = expand("%:p:h")
  let cur_file = expand("%:p:t")
  echo cur_dir
  echo cur_file
  "*\log\2011\03
  if cur_dir =~ '.*\\log\\\d\{4}\\\d\{2}'
    call PrevLogFile(cur_dir, cur_file)
    echo 'match'
  else
    call PrevNoteFile(cur_dir, cur_file)
    echo 'not match'
  endif 
endfunction

function! TodayLog()
    let g:today_file = LogFile(localtime())
endfunction

function! Str2Time(year, month, day)
  let all_day = 0
  let i = 1970
  while i < a:year
    if (i%100 == 0 && i%400 == 0) || (i%100 != 0 && i%4 == 0)
      let all_day = all_day + 366
    else
      let all_day = all_day + 365
    endif
    let i = i + 1
  endwhile

  let i = 1
  while i < a:month
    if i == 4 && a:year%4 == 0
      let all_day = all_day + 29
    elseif i ==2
      let all_day = all_day + 28
    elseif i == 4 || i == 6 || i == 9 || i == 11
      let all_day = all_day + 30
    else
      let all_day = all_day + 31
    endif
    let i = i + 1
  endwhile
  let all_day = all_day + a:day - 1

  let time = all_day*24*60*60 
  return time
endfunction

function! LogFile(time)
  return strftime("%Y", a:time) . '/'. strftime("%m", a:time) . '/log.' . strftime("%Y.%m%d", a:time) . '.md'
endfunction

nmap <F4> :call NextFile()<CR>
function! Test()
  let cur_dir = expand("%:p:h")
  let cur_file = expand("%:p:t")
  echo cur_dir
  echo cur_file
  "*\log\2011\03
  if cur_dir =~ '.*\\log\\\d\{4}\\\d\{2}'
    NextLogFile(cur_dir, cur_file)
    echo 'match'
  else
    NextNoteFile(cur_dir, cur_file)
    echo 'not match'
  endif 
endfunction


function! NextNoteFile(dir, file)
  echo a:dir
  echo a:file
  let files = GetRegularFiles(a:dir)
  echo len(files)
  let idx = 0
  while idx < len(files)
    echo files[idx]
    if stridx(files[idx], a:file) != -1
      break
    endif
    let idx = idx + 1
  endwhile

  if idx+1 < len(files)
    let g:next_file = files[idx+1]
  else
    let g:next_file = files[idx]
  endif
  echo 'next_file=' . g:next_file
endfunction


function! NextLogFile(dir, file)
  echo a:dir
  echo a:file
  if a:file =~ 'log\.\d\{4}\.\d\{4}\.txt'
    let year = strpart(a:file,4,4)
    let month = strpart(a:file,9,2)
    let day = strpart(a:file,11,2)
  endif

  let time = Str2Time(year, month, day)
  let oneday = 24*60*60
  let tomorow   = time + oneday
  let g:next_file = LogFile(tomorow)
  echo g:next_file
endfunction

function! PrevLogFile(dir, file)
  echo a:dir
  echo a:file
  if a:file =~ 'log\.\d\{4}\.\d\{4}\.txt'
    let year = strpart(a:file,4,4)
    let month = strpart(a:file,9,2)
    let day = strpart(a:file,11,2)
  endif

  let time = Str2Time(year, month, day)
  let oneday = 24*60*60
  let yesterday   = time - oneday
  let g:prev_file = LogFile(yesterday)
  echo g:prev_file
endfunction

function! PrevNoteFile(dir, file)
  echo a:dir
  echo a:file
  let files = GetRegularFiles(a:dir)
  echo len(files)
  let idx = 0
  while idx < len(files)
    echo files[idx]
    if stridx(files[idx], a:file) != -1
      break
    endif
    let idx = idx + 1
  endwhile

  if idx == 0
    let g:prev_file = files[0]
  else
    let g:prev_file = files[idx-1]
  endif
  echo 'prev_file=' . g:prev_file
endfunction

function! GetRegularFiles(dir)
  let files = split(glob(a:dir . "/*"), '\n')
  let reg_files = [] 
  for onefile in files
    if ! isdirectory(onefile)
      call add(reg_files, onefile)
    endif
  endfor
  return reg_files
endfunction
