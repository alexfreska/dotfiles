" Basics -----------------------------------------------------------------------------
" Show line numbers
set number

set mouse=a

" Language ---------------------------------------------------------------------------
autocmd FileType javascript setlocal ts=2 sts=2 sw=2

" File explorer ----------------------------------------------------------------------
" tree view
let g:netrw_liststyle = 3
" remove banner
let g:netrw_banner = 0
" open new files in horizontal split
let g:netrw_browse_split = 4
" set width
let g:netrw_winsize = 25

let g:netrw_altv = 1

" File explorer ----------------------------------------------------------------------
set hlsearch

" Plugins  ---------------------------------------------------------------------------
" automatically install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'unblevable/quick-scope'
Plug 'sheerun/vim-polyglot'
Plug 'chriskempson/base16-vim'

call plug#end()

