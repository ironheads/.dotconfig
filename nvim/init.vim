let s:curdir = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let &rtp.=','.s:curdir

" Set leader key <leader>=','
let mapleader = ','

" Load configs
for fpath in split(globpath(expand(s:curdir.'/config'), '*.vim'), '\n')
  exe 'source' fpath
endfor

" Options setup ============================================================={{{


set mouse=a
set nocompatible
" set hidden
set encoding=UTF-8
set termguicolors
" Highlight curcur
" set cursorcolumn
set cursorline
" Max pattern match memory
set maxmempattern=5000
set lazyredraw
set autoread
set hlsearch
set incsearch
" set showmode
set nobackup
" set nowrap
set number
set relativenumber

set ignorecase
set smartcase

" tab config
set ts=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

" Code fold
set foldmethod=indent
set foldlevel=99
" backspace
set backspace=indent,eol,start " backspace over everything in insert mode
" time in milliseconds to wait for a mapped sequence to complete
set timeoutlen=700

