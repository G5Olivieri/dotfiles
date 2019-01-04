set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'Quramy/tsuquyomi'
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'ErichDonGubler/vim-sublime-monokai'
Plugin 'StanAngeloff/php.vim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'chriskempson/base16-vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'raimondi/delimitmate'
Plugin 'scrooloose/nerdtree'
Plugin 'sjl/badwolf'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tomasiser/vim-code-dark'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'valloric/youcompleteme'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'w0rp/ale'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" set color 256
if !has('gui_running')
	set t_Co=256
endif

" airline theme
let g:airline_theme='simple'

set laststatus=2
syntax on

" set color
" colorscheme sublimemonokai
colorscheme badwolf

" navigate in insert mode
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-b> <C-Left>
inoremap <C-f> <C-Right>

" global .editorconfig path
let g:EditorConfig_exec_path='~/'

" git config to commit
augroup git " {{{
  autocmd!

  " Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell
  " Automatically closes Fugitive.vim buffers when leaving them
  autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END
" }}}

" no expand tab
set tabstop=2
set shiftwidth=2

" turn relative line numbers on
set number
set relativenumber

" trim on save
autocmd BufWritePre * :%s/\s\+$//e

" PHPCS ruleset file
let g:ale_php_phpcs_standard = './phpcs.xml'

" column limit line
highlight ColorColumn ctermbg=505050
set colorcolumn=120

" autoindent
map <F7> mzgg=G`z

" ctrl p exclude files
set wildignore+=*/vendor/*,*/.git/*

" Typescript {{{
if !exists("g:ycm_semantic_triggers")
	let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']
" }}}
