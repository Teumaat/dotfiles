" Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'mudpile45/vim-phpdoc'
Plugin 'groenewege/vim-less'
Plugin 'bling/vim-airline'
Plugin 'sudar/vim-arduino-syntax'
Plugin 'altercation/vim-colors-solarized'

Bundle 'smarty.vim'

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
set ignorecase

" Jump to last position in file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Smarty .tpl files contain html
au BufNewFile,BufRead *.tpl set ft=html

" Handle tmux quirks in vim
if $TERM =~ '^screen-256color'
  map <Esc>OH <Home>
  map! <Esc>OH <Home>
  map <Esc>OF <End>
  map! <Esc>OF <End>
endif

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

autocmd FileType php noremap <C-L> :!/usr/bin/env php -l %<CR>
autocmd FileType php noremap <C-X> :!/usr/bin/env php %<CR>

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Airline
let g:airline_powerline_fonts = 1
set laststatus=2 " Always show Airline
