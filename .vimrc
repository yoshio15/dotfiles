packloadall           " 全てのプラグインをロードする
silent! helptags ALL  " 全てのプラグイン用にヘルプファイルをロードする

" vim-plugでプラグインを管理する
call plug#begin()
Plug 'easymotion/vim-easymotion'
call plug#end()

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
