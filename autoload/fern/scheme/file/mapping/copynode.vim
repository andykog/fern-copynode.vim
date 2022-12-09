function! fern#scheme#file#mapping#copynode#init(disable_default_mappings) abort
  nnoremap <buffer><silent> <Plug>(fern-action-copynode-label) :<C-u>call <SID>call('copylabel')<CR>
  nnoremap <buffer><silent> <Plug>(fern-action-copynode-path) :<C-u>call <SID>call('copypath')<CR>

  if !a:disable_default_mappings
        \ && !g:fern#scheme#file#mapping#copynode#disable_default_mappings
    nmap <buffer><nowait> <leader>cp <Plug>(fern-action-copynode-label)
    nmap <buffer><nowait> <leader>cP <Plug>(fern-action-copynode-path)
  endif
endfunction

function! s:call(name, ...) abort
  return call(
        \ 'fern#mapping#call',
        \ [funcref(printf('s:map_%s', a:name))] + a:000,
        \)
endfunction

function! s:map_copylabel(helper) abort
  let l:node = a:helper.sync.get_cursor_node()
  let @*=l:node.label
endfunction

function! s:map_copypath(helper) abort
  let l:node = a:helper.sync.get_cursor_node()
  let @*=l:node._path
endfunction
