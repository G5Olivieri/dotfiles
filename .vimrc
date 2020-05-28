if empty(glob($HOME . '/.vim/autoload/plug.vim'))
  !curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs
  	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source "$HOME/.vimrc"
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug '~/fzf'
Plug 'Yggdroot/indentLine'
Plug 'chriskempson/base16-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'hashivim/vim-terraform'
Plug 'mattn/emmet-vim'
Plug 'raimondi/delimitmate'
Plug 'rking/ag.vim'
Plug 'sjl/badwolf'
Plug 'terryma/vim-multiple-cursors'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'ycm-core/YouCompleteMe'
Plug 'shawncplus/phpcomplete.vim'
Plug 'preservim/nerdtree'

" Initialize plugin system
call plug#end()

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

" ycm python
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'

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

" set tab configuration
set tabstop=2
set shiftwidth=2
set expandtab

" turn relative line numbers on
set number
set relativenumber

" trim on save
autocmd BufWritePre * :%s/\s\+$//e

" PHPCS ruleset file
let g:ale_php_phpcs_standard = './phpcs.xml'

" Fix bug invible cursor on lint error
let g:ale_echo_cursor = 0

" column limit line
highlight ColorColumn ctermbg=505050
set colorcolumn=120

" autoindent
map <F7> mzgg=G`z

" Bind ctrl p to fzf
map <C-p> :FZF<CR>

" ctrl p exclude files
set wildignore+=*/vendor/*,*/.git/*,*/node_modules/*

" Typescript {{{
if !exists("g:ycm_semantic_triggers")
	let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']
" }}}

" JSON {{{
au BufRead,BufNewFile *.json set syntax=javascript
" }}}

" Set mouse mode to true
set mouse=a

" terraform
let g:terraform_fmt_on_save = 1

" wildmenu
set wildmenu

" bind ctrl e to Explore
map <C-e> :Explore<CR>

" Disabling swap file
set noswapfile
