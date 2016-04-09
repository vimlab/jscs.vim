let s:dirname = expand('<sfile>:h')

if (exists ('g:jscs_config'))
  let s:configfile = g:jscs_config
else
  let s:configfile = s:dirname . '/../.jscsrc'
endif

function! s:JSCSFormat(line1, line2, file)
  let cmd = 'sed -n "' . a:line1 . ',' . a:line2 . 'p" ' . a:file . '| jscs -x -c ' . s:configfile
  let out = system(cmd)
  let ls = split(out, '\n', 1)

  call setline(a:line1, ls)
endfunction

function! s:initCommands()
  command! -buffer -range=% Format call s:JSCSFormat(<line1>, <line2>, expand('%'))
endfunction

autocmd! BufEnter *.js call s:initCommands()
