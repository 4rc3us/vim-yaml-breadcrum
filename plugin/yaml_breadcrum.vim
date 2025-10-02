augroup yaml_breadcrumb
  autocmd!
  autocmd FileType yaml setlocal statusline=%f\ %h%m%r\ %=%{yaml_breadcrumb#get()}\ %l:%c
augroup END
