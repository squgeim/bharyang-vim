" SECTION: Contants
" =========================
let s:asc = "asc"
let s:desc = "desc"
let s:group = "group"

" SECTION: Main body
" =========================

function! s:Bharyang(type) range
  if executable('bharyang')
    let l:sortedlines = s:SortLines(a:type, getline(a:firstline, a:lastline))
    let l:totallines = a:lastline - a:firstline + 1

    execute "normal! ". l:totallines ."dd"

    call append(a:firstline - 1, l:sortedlines)
  else
    echoe "bharyang-cli is not installed."
  endif
endfunction

function! s:SortLines(type, lines)
  let l:cmd = join(["bharyang", " --" , a:type], '')
  return systemlist(l:cmd, a:lines)
endfunction

" SECTION: Public API
" ========================

command! -range BharyangAsc <line1>,<line2>call s:Bharyang(s:asc)
command! -range BharyangDesc <line1>,<line2>call s:Bharyang(s:desc)
command! -range BharyangGroup <line1>,<line2>call s:Bharyang(s:group)

