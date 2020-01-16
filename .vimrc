set nocompatible               " be iMproved
filetype off                   " required!

" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
  let iCanHazVundle=0
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
"Add your bundles here
"...All your other bundles...
if iCanHazVundle == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :BundleInstall
endif
" Setting up Vundle - the vim plugin bundler end

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

""original repos on github
Bundle 'othree/html5.vim'
Bundle 'othree/html5-syntax.vim'
Bundle 'othree/eregex.vim'
"Bundle 'othree/vim-autocomplpop'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'jimyhuang/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
"Plugin 'SirVer/ultisnips'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/syntastic'
Bundle 'pangloss/vim-javascript'
"Bundle 'nathanaelkane/vim-indent-guides'
"Bundle 'tsaleh/vim-matchit'
Bundle 'tpope/vim-surround'
"Bundle 'uguu-org/vim-matrix-screensaver'
Bundle 'gkz/vim-ls'
Bundle 'digitaltoad/vim-jade'
Bundle 'airblade/vim-gitgutter'
"Bundle 'majutsushi/tagbar'
" Bundle 'ervandew/supertab'
"Bundle 'fatih/vim-go'
Bundle 'nsf/gocode'
Bundle 'vim-scripts/taglist.vim'
" Bundle 'chrisbra/csv.vim'

""colorscheme
" Bundle 'chriskempson/base16-vim'
Bundle 'nanotech/jellybeans.vim'
Bundle 'inside/vim-grep-operator'

""on https://github.com/vim-scripts/
Bundle 'L9'
Bundle 'jsbeautify'


" initialize for common setup
filetype plugin on
set background=dark
set t_Co=256
colorscheme jellybeans
syntax on

let mapleader = ','
set backspace=indent,eol,start
set hlsearch
set ignorecase
set smartcase
set ruler
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set fileencodings=utf8
set encoding=utf8
set pastetoggle=<F2>
set noerrorbells
set novisualbell
set ambiwidth=double
set wildmode=longest,list,full
set wildmenu

" syntax highlighting borrow from http://drupal.org/node/29325
if has("autocmd")
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.profile set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
  augroup END

  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  autocmd FileType php set omnifunc=phpcomplete#CompletePHP
endif

" tab key
nnoremap <C-t> :tabnew<CR>
nnoremap <leader>[ :tabprevious<CR>
nnoremap <leader>] :tabnext<CR>
nnoremap <leader>t :tabnext<CR>
nnoremap <leader><tab> :tabnext<CR>
inoremap <leader><tab> :tabnext<CR>

" omnifunc
" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving insert mode
inoremap <tab><tab> <C-x><tab>
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" ctrlp
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_match_window = 'min:4,max:28'
let g:ctrlp_regexp = 0
" ctrlp - replace underscore match with directory separator(CRM specific)
let g:ctrlp_abbrev = {
 \ 'gmode': 'i',
 \ 'abbrevs': [
 \  {
 \    'pattern': '_',
 \    'expanded': '/',
 \    'mode': 'prz',
 \  }
 \ ]
\ }

nnoremap <F3> :CtrlPBuffer<CR>
map <F4> <C-P><C-\>w
nnoremap <F5> :GitGutterToggle<CR>
"nnoremap <F12> :TagbarToggle<CR>
nmap <Leader>; <Plug>GitGutterPrevHunk
nmap <Leader>' <Plug>GitGutterNextHunk
nnoremap <C-a> :Gstatus<cr><c-w>T<CR>

" gitgutter
let g:gitgutter_enabled = 0
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" airline
set laststatus=2
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#hunks#enabled = 1
let g:airline_theme='light'
let g:airline_exclude_preview = 0
let g:airline_left_sep = '»'
let g:airline_right_sep = '«'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = '#'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.whitespace = 'Ξ'

" Syntastic
let g:syntastic_php_checkers=['php']
let g:syntastic_php_phpcs_args='--report=csv --standard=Drupal --extensions=php,module,inc,install,test,profile,theme'
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:syntastic_auto_jump=1
nnoremap <C-l> :SyntasticCheck<CR>

" fix indent
" nnoremap <C-i> gg=G''

" remove unecessery whitespace at the end
" http://vim.wikia.com/wiki/Remove_unwanted_spaces
nnoremap <C-k>  :%s/\s\+$//e<CR>

" remove background from colorscheme
hi Normal ctermbg=none
hi NonText ctermbg=none

" quick grep
" nmap <C-e> :grep "<cword>" *<left><left><left>
set grepprg=git\ grep\ -n\ $*
nmap <leader>g <Plug>GrepOperatorOnCurrentDirectory
vmap <leader>g <Plug>GrepOperatorOnCurrentDirectory
nmap <C-e> <Leader>giw
vmap <C-v> <Leader>g

" go specific
au FileType go nmap <Leader>gs <Plug>(go-implements)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <leader>gr <Plug>(go-run)
au FileType go nmap <leader>gb <Plug>(go-build)
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1


" ycm
let g:ycm_key_invoke_completion = '<C-f>'
"let g:loaded_youcompleteme = 1

" swp file location
set directory=$HOME/.vim
