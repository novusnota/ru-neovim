" -----------------------------------------------------------------------------
" File: gruvbox_community.vim
" Description: Retro groove color scheme for Vim
" Author: morhetz <morhetz@gmail.com>
" Source: https://github.com/gruvbox_community-community/gruvbox_community
" -----------------------------------------------------------------------------

function! gruvbox_community#invert_signs_toggle()
  if g:gruvbox_community_invert_signs == 0
    let g:gruvbox_community_invert_signs=1
  else
    let g:gruvbox_community_invert_signs=0
  endif

  colorscheme gruvbox_community
endfunction

" Search Highlighting {{{

function! gruvbox_community#hls_show()
  set hlsearch
  call GruvboxHlsShowCursor()
endfunction

function! gruvbox_community#hls_hide()
  set nohlsearch
  call GruvboxHlsHideCursor()
endfunction

function! gruvbox_community#hls_toggle()
  if &hlsearch
    call gruvbox_community#hls_hide()
  else
    call gruvbox_community#hls_show()
  endif
endfunction

" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:

