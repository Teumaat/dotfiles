" Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/syntastic'

" All Vundle plugins must be called before this line
call vundle#end()

" Solarized theme
set background=light
colorscheme solarized
let g:solarized_termcolors=256
set t_Co=256

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
  nnoremap <Esc>OH <Home>
  inoremap <Esc>OH <Home>
  vnoremap <Esc>OH <Home>
  snoremap <Esc>OH <Home>
  cnoremap <Esc>OH <Home>
  onoremap <Esc>OH <Home>

  nnoremap <Esc>OF <End>
  inoremap <Esc>OF <End>
  vnoremap <Esc>OF <End>
  snoremap <Esc>OF <End>
  cnoremap <Esc>OF <End>
  onoremap <Esc>OF <End>                                                                                                                                              
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
let g:syntastic_php_checkers = ['php']

