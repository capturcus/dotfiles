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
set guifont=Consolas\ 13
set number
set backspace=2
set clipboard=unnamed
set ff=unix
imap <C-BS> <C-W>

" ycm
let g:ycm_server_python_interpreter = '/usr/bin/python'

"ctrlp
let g:ctrlp_working_path_mode = 'ra'

"syntastic
set statusline=
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_flake8_post_args='--ignore=E501,E402,E401'

map <F7> :bro old<CR>
map <F9> <Plug>(easymotion-bd-f)
map <F10> <Plug>(easymotion-bd-jk)
map <F2> :NERDTreeToggle<CR>
nnoremap <F12> :YcmCompleter GoTo<CR>
