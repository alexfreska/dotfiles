" Basics -----------------------------------------------------------------------------
" Show line numbers
set number

set mouse=a

" Language ---------------------------------------------------------------------------
autocmd FileType javascript setlocal ts=2 sts=2 sw=2

" File explorer ----------------------------------------------------------------------
" tree view
" let g:netrw_liststyle = 3
" remove banner
" let g:netrw_banner = 0
" open new files in horizontal split
" let g:netrw_browse_split = 4
" set width
" let g:netrw_winsize = 25

" let g:netrw_altv = 1

" File explorer ----------------------------------------------------------------------
set hlsearch

" Plugins  ---------------------------------------------------------------------------
" automatically install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

" fzf installed via Homebrew
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'unblevable/quick-scope'
Plug 'sheerun/vim-polyglot'
Plug 'chriskempson/base16-vim'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'tpope/vim-vinegar'

call plug#end()

" COC -------------------------------------------------------------------------------
" if hidden is not set, TextEdit might fail.
set hidden

" always show signcolumns
set signcolumn=yes

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" fzf -------------------------------------------------------------------------

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

