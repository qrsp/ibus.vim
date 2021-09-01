scriptencoding utf-8

if &cp || exists("g:loaded_ibus") || !exists('$DISPLAY')
  finish
endif

let g:loaded_ibus = 1

inoremap <silent> <Plug>IbusToggle <C-R>=ibus#toggle('i')<CR>
nnoremap <silent> <Plug>IbusToggle :<C-U>call ibus#toggle('n')<CR>
inoremap <silent> <Plug>IbusEngineNext <C-R>=ibus#insert_select(1)<CR>
nnoremap <silent> <Plug>IbusEngineNext :<C-U>call ibus#normal_select(1)<CR>
inoremap <silent> <Plug>IbusEnginePrev <C-R>=ibus#insert_select(-1)<CR>
nnoremap <silent> <Plug>IbusEnginePrev :<C-U>call ibus#normal_select(-1)<CR>

if !exists("g:ibus_no_mappings") || ! g:ibus_no_mappings
  imap <C-B><C-B> <Plug>IbusToggle
  nmap <C-B><C-B> <Plug>IbusToggle
  imap <C-B><C-]> <Plug>IbusEngineNext
  nmap <C-B><C-]> <Plug>IbusEngineNext
  imap <C-B><C-[> <Plug>IbusEnginePrev
  nmap <C-B><C-[> <Plug>IbusEnginePrev
endif
