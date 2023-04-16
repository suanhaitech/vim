" 插入Doygen 的注释 
function! InsertDoxygenComment()
  let l:line = getline('.')
  let l:language = &filetype

  if l:language == 'python'
    let l:match = matchlist(l:line, '^\s*\(def\|class\)\s\+\(\w\+\)\s*\(.*\)$')
  elseif l:language == 'c' || l:language == 'cpp'
    let l:match = matchlist(l:line, '^\s*\(.*\)\s\+\(\w\+\)\s*\(.*\)$')
  else
    echo "Language not supported"
    return
  endif

  if len(l:match) == 0
    return
  endif

  let l:type = l:match[1]
  let l:name = l:match[2]

  if l:language == 'python'
    let l:comment = [
          \ '"""@brief ' . l:name,
          \ '',
          \ '@details',
          \ ''
          \]

    if l:type == 'def'
      let l:args = matchlist(l:match[3], '\((.*)\)')
      if len(l:args) > 0
        let l:args = split(l:args[1], ',')
        for l:arg in l:args
          call insert(l:comment, '@param ' . l:arg . ' ', len(l:comment) - 1)
        endfor
      endif
    endif

    call insert(l:comment, '"""', len(l:comment))
  elseif l:language == 'c' || l:language == 'cpp'
    let l:comment = [
          \ '/**',
          \ ' * @brief ' . l:name,
          \ ' *',
          \ ' * @details',
          \ ' *',
          \ ' */'
          \]
  endif

  call append(line('.') - 1, l:comment)
endfunction

nnoremap <silent> <F5> :call InsertDoxygenComment()<CR>

