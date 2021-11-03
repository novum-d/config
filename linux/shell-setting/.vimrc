call plug#begin()
Plug 'preservim/NERDTree'
call plug#end()

syntax enable
colorscheme moonshine



" マッピング設定
" jjでエスケープ
inoremap jj <ESC>

" 1つずつ左に移動
inoremap <C-l> <ESC>la
noremap <C-l> <ESC>la

" 1つ下の行末に移動
inoremap <C-j> <ESC>$a<Enter>
noremap <C-j> <ESC>$a<Enter>

