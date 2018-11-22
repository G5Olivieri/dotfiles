set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'StanAngeloff/php.vim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'raimondi/delimitmate'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'valloric/youcompleteme'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'w0rp/ale'
Plugin 'Yggdroot/indentLine'
Plugin 'chriskempson/base16-vim'
Plugin 'ErichDonGubler/vim-sublime-monokai'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

if !has('gui_running')
	set t_Co=256
endif

let g:airline_theme='simple'

set laststatus=2
syntax on
colorscheme sublimemonokai

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-b> <C-Left>
inoremap <C-f> <C-Right>

let g:EditorConfig_exec_path='~/'

augroup git " {{{
  autocmd!

  " Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell
  " Automatically closes Fugitive.vim buffers when leaving them
  autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END
" }}}

set noexpandtab

" turn relative line numbers on
set number
set relativenumber

autocmd BufWritePre * :%s/\s\+$//e

let g:ale_php_phpcs_standard = './phpcs.xml'
