filetype plugin on
let mapleader = "`"

" borrow from http://weierophinney.net/matthew/archives/164-Vim-Productivity-Tips-for-PHP-Developers.html
autocmd FileType php noremap <C-L> :!/usr/bin/php -l %<CR>

" autocomplete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" syntax highlighting
" borrow from http://drupal.org/node/29325
if has("autocmd")
  " Drupal *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.profile set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
  augroup END

  " auto complete
  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  autocmd FileType php set omnifunc=phpcomplete#CompletePHP
endif
syntax on

colorscheme desert
set hlsearch
set ruler
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set fileencodings=utf8
set encoding=utf8
set ff=unix
set pastetoggle=<F2>

" tab key
" tab navigation like firefox
nnoremap <C-t> :tabnew<CR>
nnoremap <leader>[ :tabprevious<CR>
nnoremap <leader>] :tabnext<CR>
nnoremap <leader>t :tabnext<CR>
inoremap <C-t> <Esc>:tabnew<CR>
inoremap <leader>[ <Esc>:tabprevious<CR>i
inoremap <leader>] <Esc>:tabnext<CR>i
inoremap <leader>t <Esc>:tabnext<CR>

" nerdtree
map <F1> :NERDTreeToggle<CR>
let NERDTreeChDirMode=2
let NERDTreeQuitOnOpen=1
let NERDTreeShowBookmarks=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1

" fuzzfind
map <leader>f :FufFile<CR>
map <leader>F :FufFile **/<CR>

" http://www.vim.org/scripts/script.php?script_id=1355 include php-doc
" source ~/.vim/php-doc.vim 
inoremap <C-p><ESC>:call PhpDocSingle()<CR>i 
nnoremap <C-p> :call PhpDocSingle()<CR> 
vnoremap <C-p> :call PhpDocRange()<CR> 

" close bracket
" Return a corresponding paren to be sent to the buffer
function! CloseParen()
    let parenpairs = {'(' : ')',
                   \  '[' : ']',
                   \  '{' : '}'}

    let [m_lnum, m_col] = searchpairpos('[[({]', '', '[\])}]', 'nbW')

    if (m_lnum != 0) && (m_col != 0)
        let c = getline(m_lnum)[m_col - 1]
        return parenpairs[c]
    endif
    return ''
endfun
inoremap <C-c> <C-r>=CloseParen()<CR>

" remap omnifunc
inoremap <leader>` <C-x><C-o>
