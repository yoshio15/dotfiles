" ~/.pyenv/shimsを$PATHに追加
" jedi-vim や vim-pyenc のロードよりも先に行う必要がある、はず。
let g:python3_host_prog='/Users/kondoyoshio/.pyenv/shims/python'

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/dotfiles/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'davidhalter/jedi-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"----------------------------------------
" 表示設定
"----------------------------------------
" 行番号を表示
set number
" タイトルを表示
set title
" コメントの色を水色
hi Comment ctermfg=DarkCyan
" yでコピーした時にクリップボードに入る
set guioptions+=a
" シンタックスハイライトの有効化
syntax enable
" INSERTモードで挿入する時適切な数の空白を補う
set expandtab
" 前回の検索パターンが存在する時、それにマッチするテキストを全て強調表示
set hlsearch
" 検索パターンにおいて大文字と小文字を区別しない
set ignorecase
" インクリメンタルサーチ
set incsearch
" 最下ウィンドウにステータス行を常に表示
set laststatus=2
" 新しい行のインデントを現在行と同じにする
set autoindent
" 暗い背景によく合う色にセット
set background=dark
" タブをスペース4文字とカウント
set tabstop=4
" カラースキームを変更
colorscheme desert
