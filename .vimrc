" Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'L9'
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'mudpile45/vim-phpdoc'
Plugin 'groenewege/vim-less'
Plugin 'bling/vim-airline'
Plugin 'sudar/vim-arduino-syntax'
Plugin 'altercation/vim-colors-solarized'
Plugin 'sumpygump/php-documentor-vim'
"Plugin 'othree/vim-autocomplpop'

" All Vundle plugins must be called before this line
call vundle#end()

" Solarized theme
set background=dark
colorscheme solarized
" Uncomment these 2 lines for gnome-terminal
"let g:solarized_termcolors=256
"set t_Co=256

syntax on
filetype plugin indent on
set autoindent
set nocompatible
set tabstop=2
set shiftwidth=2
set expandtab
set notbs
set nopaste
set incsearch
set hlsearch
set shell=/bin/bash
set backspace=indent,eol,start

" Jump to last position in file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Smarty .tpl files contain html
au BufNewFile,BufRead *.tpl set ft=html

" PHPDoc
au BufRead,BufNewFile *.php inoremap <buffer> <C-P> :call PhpDoc()<CR>
au BufRead,BufNewFile *.php nnoremap <buffer> <C-P> :call PhpDoc()<CR>
au BufRead,BufNewFile *.php vnoremap <buffer> <C-P> :call PhpDocRange()<CR>
let g:pdv_cfg_Package = 'IZICMS'
let g:pdv_cfg_Version = '1.0'
let g:pdv_cfg_Author = 'Pieter Hensen <pieter@shoppagina.nl>'
let g:pdv_cfg_Copyright = "Copyright (C) Shoppagina - All Rights Reserved"
let g:pdv_cfg_License = "Proprietary and confidential"
let g:pdv_cfg_ClassTags = ["package","author","copyright","license","version"]

" Handle tmux quirks in vim
if $TERM =~ '^screen-256color'
  map <Esc>OH <Home>
  map! <Esc>OH <Home>
  map <Esc>OF <End>
  map! <Esc>OF <End>
endif

" PHP auto format
map <Leader>p mz:silent 1,$!phpcbf<CR> gg=G`z

" Session quick save
map <silent> <F5> :mks! ~/.vim/session.vim<CR>
map <silent> <F7> :source ~/.vim/session.vim<CR>

map <F6> :Texplore<CR>

" Auto complete
set tags=./tags;/
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType less set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
imap <tab> <C-x><C-o>
set wildmenu                        " Enable wildcard menu
set wildmode=list:longest

autocmd FileType php noremap <C-L> :!/usr/bin/env php -l %<CR>
autocmd FileType php noremap <C-X> :!/usr/bin/env php %<CR>

"" Highlight unwanted spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
"" Fix supposed memleak when matching too often
if version >= 702
  autocmd BufWinLeave * call clearmatches()
endif

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_php_checkers = ['php']

" Airline
let g:airline_powerline_fonts = 1
set laststatus=2 " Always show Airline

" Enable grep searching with :grep findword
set grepprg=grep\ -nir\ $*\ *

" Make PHP indent cases in switch statements
let g:PHP_vintage_case_default_indent=1
