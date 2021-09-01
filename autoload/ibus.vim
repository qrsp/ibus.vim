let s:ibuspyfile = expand('<sfile>:r') . '.py'

function! ibus#toggle(mode)
  if !exists("s:ibus_enabled")
    if has('python3')
      let g:ibus_insert_engines_idx = 0
      let g:ibus_normal_engines_idx = 0
      exe 'py3file' s:ibuspyfile
    else
      echohl Error | echo "Can't find Python3 provider." | echohl None
      return ""
    endif
  endif

  if get(s:, 'ibus_enabled', 0) == 1
    let s:ibus_enabled = 0
    echo 'IBUS.VIM DISABLE.'

    augroup ibus_vim
      autocmd!
    augroup END
  else
    let s:ibus_enabled = 1
    echo 'IBUS.VIM ENABLE.'

    if a:mode == 'i'
      py3 ibusUtil.insert()
    else
      py3 ibusUtil.normal()
    endif

    augroup ibus_vim
      autocmd!
      autocmd InsertEnter * py3 ibusUtil.insert()
      autocmd InsertLeavePre * py3 ibusUtil.normal()
      autocmd CmdlineEnter [/\?] py3 ibusUtil.insert()
      autocmd CmdlineLeave [/\?] py3 ibusUtil.normal()
      autocmd FocusGained * py3 ibusUtil.focus()
    augroup END
  endif

  return ""
endfunction

function! ibus#insert_select(offset)
  let g:ibus_insert_engines_idx = (g:ibus_insert_engines_idx + a:offset) % len(g:ibus_insert_engines)
  py3 ibusUtil.insert()
  return ""
endfunction

function! ibus#normal_select(offset)
  let g:ibus_normal_engines_idx = (g:ibus_normal_engines_idx + a:offset) % len(g:ibus_normal_engines)
  py3 ibusUtil.normal()
  return ""
endfunction

