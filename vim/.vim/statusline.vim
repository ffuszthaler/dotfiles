
" CUSTOM STATUSLINE

" Highlight Groups 1-9
" hi User1 is set by ChangeStatuslineColor
hi User2 ctermfg=008
" hi User3 is User3 but inverted

let g:currentmode={
  \ 'n'      : 'N ',
  \ 'no'     : 'N·Operator Pending ',
  \ 'v'      : 'V ',
  \ 'V'      : 'V·Line ',
  \ "\<C-V>" : 'V·Block ',
  \ 's'      : 'Select ',
  \ 'S'      : 'S·Line ',
  \ "\<C-S>" : 'S·Block ',
  \ 'i'      : 'I ',
  \ 'R'      : 'R ',
  \ 'Rv'     : 'V·Replace ',
  \ 'c'      : 'Command ',
  \ 'cv'     : 'Vim Ex ',
  \ 'ce'     : 'Ex ',
  \ 'r'      : 'Prompt ',
  \ 'rm'     : 'More ',
  \ 'r?'     : 'Confirm ',
  \ '!'      : 'Shell ',
  \ 't'      : 'Terminal '
  \}

function! ChangeStatuslineColor()
  if (mode() =~# '\v(n|no)')
    exe 'hi! User1 ctermfg=black ctermbg=white'
    exe 'hi! User3 ctermfg=white'
  elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
    exe 'hi! User1 ctermfg=black ctermbg=005'
    exe 'hi! User3 ctermfg=005'
  elseif (mode() ==# 'i')
    exe 'hi! User1 ctermfg=black ctermbg=blue'
    exe 'hi! User3 ctermfg=blue'
  else
    exe 'hi! User1 ctermfg=black ctermbg=006'
    exe 'hi! User3 ctermfg=006'
  endif
  return ''
endfunction

function! ReadOnly()
  if &readonly || !&modifiable
    " return ''
    return 'RO'
  else
    return ''
endfunction

function! GitInfo()
  let git = fugitive#head()
  if git != ''
    " return ' '.fugitive#head()
    return fugitive#head()
  else
    return ''
endfunction

" airline_left_sep = ''
" airline_left_alt_sep = ''
" airline_right_sep = ''
" airline_right_alt_sep = ''

" Restore normal highlight with %0*
set statusline=
set statusline+=%{ChangeStatuslineColor()}
set statusline+=%1*
set statusline+=\ %{toupper(g:currentmode[mode()])}
set statusline+=%3*
set statusline+=
set statusline+=%2*
" set statusline+=\ [%n] " Buffer Nr
set statusline+=\ %{GitInfo()}
" set statusline+=\ <<
set statusline+=\ %f
set statusline+=%m " Modified
" set statusline+=\ >>
" set statusline+=\ %F " Full path
set statusline+=\ %{ReadOnly()}
set statusline+=%=
set statusline+=%2*
" set statusline+=\ <<
set statusline+=\ %{&fileformat}
set statusline+=\ 
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ 
set statusline+=\ %y
set statusline+=\ 
set statusline+=\ %p%%
" set statusline+=\ 
set statusline+=%3*
set statusline+=\ 
set statusline+=%1*
set statusline+=\ %l:%c
" set statusline+=\ >>
set statusline+=\ 
