# curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin()
Plug 'karoliskoncevicius/moonshine-vim'
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


