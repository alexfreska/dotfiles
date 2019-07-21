" Basics -----------------------------------------------------------------------------
" Show line numbers
set number

set mouse=a

" Language ---------------------------------------------------------------------------
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType typescript setlocal ts=2 sts=2 sw=2
autocmd FileType typescript.tsx setlocal ts=2 sts=2 sw=2

" " Netrw ----------------------------------------------------------------------
" " tree view
" let g:netrw_liststyle = 3
" " remove banner
" let g:netrw_banner = 0
" " open new files in horizontal split
" let g:netrw_browse_split = 4
" " set width
" let g:netrw_winsize = 25
" " new window and cursor at right
" let g:netrw_altv = 1

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
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'Raimondi/delimitMate'

call plug#end()

" Auto-commands ---------------------------------------------------------------
augroup autocmd_group " {
  autocmd!
  " return to last known position when opening file
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  " remove trailing whitespace
  autocmd BufWritePre * call StripTrailingWhitespaces()
  " auto-reload .vimrc
  " autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
  autocmd ColorScheme * highlight CursorLineNR  ctermfg=15  ctermbg=15
        \ | highlight CursorLine ctermbg=bg
        \ | highlight EndOfBuffer   ctermfg=bg  ctermbg=bg
        \ | highlight LineNr        ctermfg=8 ctermbg=bg
        \ | highlight Tabline       ctermfg=fg  ctermbg=bg
        \ | highlight TablineFill   ctermfg=fg  ctermbg=bg
        \ | highlight TablineSel    ctermfg=2   ctermbg=bg
        \ | highlight StatusLine    ctermfg=2   ctermbg=bg
        \ | highlight StatusLineNC  ctermfg=fg  ctermbg=bg
        \ | highlight VertSplit     ctermfg=239  ctermbg=bg
        \ | highlight ColorColumn   ctermfg=7   ctermbg=bg cterm=bold
        \ | highlight SignColumn    ctermfg=bg  ctermbg=bg
        \ | highlight CocErrorSign  ctermfg=9  ctermbg=bg
        \ | highlight CocWarningSign  ctermfg=11  ctermbg=bg
        \ | highlight CocInfoSign  ctermfg=7  ctermbg=bg
        \ | highlight CocHintSign  ctermfg=13  ctermbg=bg
        \ | highlight Search  ctermfg=15 ctermbg=13
        \ | highlight Pmenu  ctermbg=8
        \ | highlight CocErrorFloat ctermbg=8
        \ | highlight CocWarningFloat ctermbg=8
        \ | highlight CocInfoFloat ctermbg=8
        \ | highlight CocHintFloat ctermbg=8
        \ | highlight PmenuSel  ctermbg=8
        \ | highlight Visual  ctermbg=99
        \ | call matchadd('ColorColumn', '\%81v', 100)

  autocmd ColorScheme * highlight QuickScopePrimary ctermfg=2 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary ctermfg=4 cterm=underline
augroup END " }


" Colors ----------------------------------------------------------------------
colorscheme base16-default-dark

" GUI ------------------------------------------------------------------------
set colorcolumn=81
" set cursorline
set hidden
" set cursorline

" Indentation ----------------------------------------------------------------
set expandtab
set shiftround
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Text & other whitespace -----------------------------------------------------
set list
set listchars=tab:→\ ,eol:¬,nbsp:+
set nowrap

" COC -------------------------------------------------------------------------
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

" " Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

" " Use tab for trigger completion with characters ahead and navigate.
" " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" " Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" fzf -------------------------------------------------------------------------

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
map <C-p> :Files<CR>
map <C-Space> :Ag<CR>


" NERDTree ------------------------------------------------------------------
let NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = ['^build$', '^node_modules$']
map <C-n> :NERDTreeToggle<CR>
map <C-m> :NERDTreeFind<CR>


" Functions -------------------------------------------------------------------

" put cursor back where it was before invoking a command
function! StripTrailingWhitespaces()
  " preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " do the business:
  %s/\s\+$//e
  " clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
