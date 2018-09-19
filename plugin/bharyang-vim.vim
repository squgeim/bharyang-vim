" =========================
" SECTION: Globals
" =========================
let g:bharyang_default_sort_type = "asc"

" =========================
" SECTION: Constants
" =========================
"
let s:asc = "asc"
let s:desc = "desc"
let s:group = "group"

" =========================
" SECTION: Main body
" =========================

function! s:Bharyang(type) range
  " Check if the type is valid, because the user exposed global sort type might change it to something else.
  if a:type !=# s:asc && a:type !=# s:desc && a:type !=# s:group
    echoe "Sort type ".a:type." is not compatible with Bharyang. Use one of `asc`, `desc` or `group`."

    return
  endif

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

" ========================
" SECTION: Public API
" ========================

command! -range Bharyang <line1>,<line2>call s:Bharyang(g:bharyang_default_sort_type)
command! -range BharyangAsc <line1>,<line2>call s:Bharyang(s:asc)
command! -range BharyangDesc <line1>,<line2>call s:Bharyang(s:desc)
command! -range BharyangGroup <line1>,<line2>call s:Bharyang(s:group)

