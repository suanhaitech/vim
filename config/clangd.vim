function! SetupHeaderGuard()
    let filename = expand('%:t')
    let guard = toupper(substitute(filename, '[^a-zA-Z0-9]', '_', 'g'))
    let guard .= '_'

    " 删除现有的 Header Guard 语句
    silent! execute 'g/^\s*#\s*ifndef\|^\s*#\s*define\|^\s*#\s*endif/d'

    " 插入新的 Header Guard 语句
    call setline(1, '#ifndef ' . guard)
    call append(1, '#define ' . guard)
    call append(line('$'), '')
    call append(line('$'), '#endif // ' . guard)
endfunction

command! UpdateHeaderGuard call SetupHeaderGuard()

autocmd BufNewFile *.h,*.hpp call SetupHeaderGuard()

