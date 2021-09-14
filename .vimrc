if empty(glob($HOME . '/.vim/autoload/plug.vim'))
  !curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs
  	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source "$HOME/.vimrc"
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'Raimondi/delimitMate'
Plug 'rking/ag.vim'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/jsonc.vim'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'sebdah/vim-delve'

" Initialize plugin system
call plug#end()

set laststatus=2
set statusline=%<%f\ %h%m%r%{exists('g:loaded_fugitive')?fugitive#statusline():''}%=%-14.(%l,%c%V%)\ %P

syntax on

" set color
" colorscheme sublimemonokai
autocmd vimenter * ++nested colorscheme gruvbox
set background=dark    " Setting dark mode

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

" column limit line
highlight ColorColumn ctermbg=505050
set colorcolumn=80

" autoindent
map <F7> mzgg=G`z

" Bind ctrl p to fzf
map <C-p> :FZF<CR>

" ctrl p exclude files
set wildignore+=*/vendor/*,*/.git/*,*/node_modules/*

" Set mouse mode to true
set mouse=a

" wildmenu
set wildmenu

" bind ctrl e to Explore
map <C-e> :Explore<CR>

" Disabling swap file
set noswapfile

" relative path (src/foo.txt)
nnoremap <leader>cf :let @+=expand("%")<CR>

" absolute path (/something/src/foo.txt)
nnoremap <leader>cF :let @+=expand("%:p")<CR>

" filename (foo.txt)
nnoremap <leader>ct :let @+=expand("%:t")<CR>

" directory name (/something/src)
nnoremap <leader>ch :let @+=expand("%:p:h")<CR>

" tsconfig.json is actually jsonc, help TypeScript set the correct filetype
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
