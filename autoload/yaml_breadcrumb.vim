function! yaml_breadcrumb#get() abort
  let lnum = line('.')
  let path = []
  let curindent = indent(lnum)

  for i in range(lnum, 1, -1)
    let ln = getline(i)
    if ln =~ '^\s*$' || ln =~ '^\s*#'
      continue
    endif

    let m = matchlist(ln, '^\s*-\?\s*\zs\([^:]\+\)\s*:')
    if !empty(m)
      let key = substitute(m[1], '^\s\+|\s\+$', '', 'g')
      let ind = indent(i)
      if ind <= curindent
        call add(path, key)
        let curindent = ind
      endif
    endif
  endfor

  if empty(path)
    return ''
  endif

  call reverse(path)
  return join(path, ' › ')
endfunction

