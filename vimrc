filetype on
filetype indent on
filetype plugin on
syntax on

set nocompatible

set number
set norelativenumber

set hidden
set lazyredraw

" set termguicolors

set backspace=indent,eol,start
set history=1000
set scrolloff=4
set tabstop=2
set shiftwidth=2
set smarttab

set textwidth=80
set colorcolumn=80

set wildmenu
set expandtab
set autoindent

set incsearch
set hlsearch

let mapleader="\<Space>"

nmap 0 ^

nmap <C-s> :w<cr>
imap <C-s> <esc>:w<cr>

nmap <Up> <C-w>k
nmap <Down> <C-w>j
nmap <Left> <C-w>h
nmap <Right> <C-w>l

nmap <Leader>// :Ack<space>
nmap <Leader>/w :Rg <cword><cr>
nmap <Leader>cr :call VimuxRunCommand("ruby ".expand("%"))<cr>
nmap <Leader>h :nohl<cr>
nmap <Leader>h :noh<cr>
nmap <Leader>oo :Files<cr>
nmap <Leader>op :!open %<cr>
nmap <Leader>re m`ggvG=``
nmap <Leader>so :source $MYVIMRC<cr>
nmap <Leader>vr :sp $MYVIMRC<cr>
nmap <Leader>ne :lnext<cr>
nmap <Leader>pe :lprev<cr>
nmap <Leader>bl :Git blame<cr>
nmap <Leader>tb :TagbarToggle<cr>
nmap <Leader>tt :TestNearest<cr>
nmap <Leader>tf :TestFile<cr>
nmap <Leader>fsl i# frozen_string_literal: true<esc>o<esc>xxo
nmap <Leader>qr :QuickRun<cr>

vnoremap // y/<C-r>"<cr>

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundles')
  Plug 'janko-m/vim-test'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'
  Plug 'vim-ruby/vim-ruby'
  Plug 'dense-analysis/ale'
  Plug 'pangloss/vim-javascript'
  Plug 'benmills/vimux'
  Plug 'ervandew/supertab'
  Plug 'mhartington/oceanic-next'
  Plug 'junegunn/seoul256.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'thinca/vim-quickrun'
call plug#end()

set clipboard=unnamed

set splitbelow
set splitright
set winwidth=80

set exrc
set secure

set re=1

let test#strategy = "vimux"
let g:VimuxUseNearest = 0

let ruby_fold=1

let g:ale_fixers = {
\   'ruby': ['rubocop'],
\}

colo seoul256
let g:seoul256_srgb = 1
