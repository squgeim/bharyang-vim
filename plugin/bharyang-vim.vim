let s:asc = "asc"
let s:desc = "desc"
let s:group = "group"

function! BharyangGroup() range
  call s:Bharyang(s:group, a:firstline, a:lastline)
endfunction

function! BharyangAsc() range
  call s:Bharyang(s:asc, a:firstline, a:lastline)
endfunction

function! BharyangDesc() range
  call s:Bharyang(s:desc, a:firstline, a:lastline)
endfunction


function! s:Bharyang(type, _firstline, _lastline)
  if executable('bharyang')
    let l:sorted_lines = s:SortLines(a:type, getline(a:_firstline, a:_lastline))
    let l:total_lines = a:_lastline - a:_firstline + 1

    execute "normal! ". l:total_lines ."dd"

    call append(a:firstline - 1, l:sorted_lines)
  else
    echoe "bharyang-cli is not installed."
  endif
endfunction

function! s:SortLines(type, lines)
  let l:cmd = join(["bharyang", " --" , a:type], '')
  return systemlist(l:cmd, a:lines)
endfunction
