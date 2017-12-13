syntax enable
syntax on
set encoding=utf-8
setglobal fileencoding=utf-8
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set guioptions-=L
set guioptions-=R
set guioptions-=r
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar

set guifont=Hack\ 12
set number
set backspace=2
set clipboard=unnamedplus
set ff=unix
set incsearch
set hlsearch

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
