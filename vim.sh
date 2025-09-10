#!/usr/bin/env bash

set -e
sudo apt update
sudo apt install -y vim-gtk3 git curl fonts-firacode fzf
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cat > ~/.vimrc <<'EOF'
" ------------------------------
" General Settings
" ------------------------------
set nocompatible
syntax on
set termguicolors
set number
set relativenumber
set cursorline
set expandtab shiftwidth=4 softtabstop=4 tabstop=4
set mouse=a
set clipboard=unnamedplus
set ignorecase smartcase

" ------------------------------
" Plugin Setup
" ------------------------------
call plug#begin('~/.vim/plugged')

" VS Code theme
Plug 'tomasiser/vim-code-dark'

" File explorer
Plug 'preservim/nerdtree'

" Icons
Plug 'ryanoasis/vim-devicons'

" Statusline like VS Code
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Fuzzy file search (like Ctrl+P in VS Code)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Git integration
Plug 'tpope/vim-fugitive'

" Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Syntax highlighting / LSP-like feel
Plug 'sheerun/vim-polyglot'

" Multi-cursor
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Easy commenting
Plug 'tpope/vim-commentary'

" Auto pairs
Plug 'jiangmiao/auto-pairs'

call plug#end()

" ------------------------------
" UI Setup
" ------------------------------
colorscheme codedark
let g:airline_theme='codedark'

" NerdTree toggle (like VS Code sidebar)
nnoremap <C-b> :NERDTreeToggle<CR>

" FZF find file (like Ctrl+P)
nnoremap <C-p> :Files<CR>

" ------------------------------
" COC (Autocompletion)
" ------------------------------
" Use tab for completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
EOF

vim +PlugInstall +qall
