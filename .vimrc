set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" add plugins here

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'flazz/vim-colorschemes'
Bundle 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'easymotion/vim-easymotion'
Plugin 'tell-k/vim-autopep8'
Plugin 'Valloric/YouCompleteMe'
Plugin 'bitc/vim-hdevtools'
Plugin 'raichoo/purescript-vim'
Plugin 'FrigoEU/psc-ide-vim'
Plugin 'ianks/vim-tsx'
Plugin 'leafgarland/typescript-vim'
Plugin 'mxw/vim-jsx'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"colorscheme solarized
syntax enable
syntax on
colorscheme Monokai
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
imap <C-BS> <C-W>

" ycm
let g:ycm_server_python_interpreter = '/usr/bin/python'
autocmd CompleteDone * pclose

"ctrlp
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_cmd = 'CtrlPMixed'

"syntastic
set statusline=
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_typescript_checkers = ['tslint']
"let g:syntastic_html_checkers = ['jshint']
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_python_flake8_post_args='--ignore=E501,E402,E401'

" purescript
let g:psc_ide_server_port = 9753

au FileType haskell nnoremap <buffer> <F6> :HdevtoolsType<CR>
map <F7> :bro old<CR>
map <F9> <Plug>(easymotion-bd-f)
map <F10> <Plug>(easymotion-bd-jk)
map <F2> :NERDTreeToggle<CR>
nnoremap <F12> :YcmCompleter GoTo<CR>
nnoremap <C-t> :tabnew<CR>

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
