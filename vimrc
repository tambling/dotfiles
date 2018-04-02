filetype on
filetype indent on
filetype plugin on
syntax on

set nocompatible

set number
set relativenumber

set hidden
set lazyredraw

set backspace=indent,eol,start
set history=1000
set scrolloff=4
set background=dark
set tabstop=2
set shiftwidth=2
set smarttab

set textwidth=80

set wildmenu
set expandtab
set autoindent

set incsearch
set hlsearch

let mapleader="\<Space>"

nmap 0 ^

nmap <C-s> :w<cr>
imap <C-s> <esc>:w<cr>

nmap <Left> <C-w>h
nmap <Up> <C-w>k
nmap <Down> <C-w>j
nmap <Right> <C-w>l

nmap <Leader>// :Ack<space>
nmap <Leader>/w :Ack <cword><cr>
nmap <Leader>h :nohl<cr>
nmap <Leader>h :noh<cr>
nmap <Leader>oo :Files<cr>
nmap <Leader>op :!open %<cr>
nmap <Leader>re m`ggvG=``
nmap <Leader>so :source $MYVIMRC<cr>
nmap <Leader>vr :sp $MYVIMRC<cr>
nmap <Leader>ne :lnext<cr>
nmap <Leader>pe :lprev<cr>
nmap <Leader>bl :Gblame<cr>

nmap <Leader>rc :call RunCurrentSpecFile()<cr>
nmap <Leader>rn :call RunNearestSpec()<cr>
nmap <Leader>rl :call RunLastSpec()<cr>
nmap <Leader>ra :call RunAllSpecs()<cr>

vnoremap // y/<C-r>"<cr>


call plug#begin('~/.vim/bundles')
  Plug 'chriskempson/base16-vim'  
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-ragtag'
  Plug 'tpope/vim-fugitive'
  Plug 'mileszs/ack.vim'
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'thoughtbot/vim-rspec'
  Plug 'scrooloose/syntastic'
  Plug 'ervandew/supertab'
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
  Plug 'xolox/vim-easytags'
  Plug 'xolox/vim-misc'
  Plug 'suan/vim-instant-markdown'
  Plug 'vim-ruby/vim-ruby'
call plug#end()

colorscheme base16-default-dark

set clipboard=unnamed


set splitbelow
set splitright
set winwidth=80

if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif

let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_ruby_checkers=['rubocop']
let g:syntastic_always_populate_loc_list=1

let g:prettier#config#single_quote="true"
let g:prettier#config#trailing_comma="es5"
let g:prettier#config#bracket_spacing="true"
let g:prettier#config#jsx_bracket_same_line="false"

let g:jsx_ext_required = 0

let g:rspec_command = "!clear; rspec -f d {spec}"
