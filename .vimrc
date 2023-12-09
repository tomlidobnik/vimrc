set laststatus=2
set number
set relativenumber
syntax on
set tabstop=4
set hlsearch
set history=100
set nocompatible
filetype on
filetype plugin on
filetype indent on

call plug#begin('~/.vim/plugged')
	Plug 'preservim/nerdtree'
	Plug 'itchyny/lightline.vim'
	Plug 'mattn/emmet-vim'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'tpope/vim-fugitive'
call plug#end()

let mapleader = "\<Space>"
nnoremap <Leader>pf :Files .<CR>
nnoremap <Leader>gf :GFiles<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
