"------------------------------------------------------------------
"
"   ___      ___  ___   _____ ______    ________   ________     
"  |\  \    /  /||\  \ |\   _ \  _   \ |\   __  \ |\   ____\    
"  \ \  \  /  / /\ \  \\ \  \\\__\ \  \\ \  \|\  \\ \  \___|    
"   \ \  \/  / /  \ \  \\ \  \\|__| \  \\ \   _  _\\ \  \       
" ___\ \    / /    \ \  \\ \  \    \ \  \\ \  \\  \|\ \  \____  
" |\__\\ \__/ /      \ \__\\ \__\    \ \__\\ \__\\ _\ \ \_______\
" \|__| \|__|/        \|__| \|__|     \|__| \|__|\|__| \|_______|
"
"
"------------------------------------------------------------------

set encoding=utf-8    " Vim内部で使われる文字エンコーディングを設定
scriptencoding utf-8  " スクリプトで使われている文字コードを宣言
packloadall           " 全てのプラグインをロードする
silent! helptags ALL  " 全てのプラグイン用にヘルプファイルをロードする

"----------------------------------------
" plugins
"----------------------------------------
call plug#begin()
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdtree'
Plug 'vim-jp/vimdoc-ja'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Yggdroot/indentLine'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'skanehira/preview-markdown.vim'
Plug 'LeafCage/vimhelpgenerator'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
call plug#end()

"----------------------------------------
" auto commands
"----------------------------------------
augroup MyAutoCmd
  autocmd!
augroup END
autocmd MyAutoCmd BufWritePost .vimrc source $MYVIMRC

"----------------------------------------
" variables
"----------------------------------------
" フォルダアイコンを表示
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
" deoplete.nvim用の設定値
let g:deoplete#enable_at_startup = 1
" vim-jsx-pretty用の設定値
let g:vim_jsx_pretty_highlight_close_tag = 0
let g:vim_jsx_pretty_colorful_config = 1
" skanehira/preview-markdown.vim用の設定値
let g:preview_markdown_vertical = 1
let g:preview_markdown_auto_update = 1
" ファイルを開いたらNERDTreeを閉じる
let g:NERDTreeQuitOnOpen = 1
" 親ディレクトリへ移動
let g:NERDTreeMapUpdir = '<C-u>'
" BlogPost用のBase-Path
let g:blogpost_base_path = '~/Sources/00_YoshioNote/yoshionote/content/blog/'

"----------------------------------------
" general
"----------------------------------------
" 行番号を表示
set number
" タイトルを表示
set title
" yでコピーした時にクリップボードに入る
set guioptions+=a
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
" スマートインデント（autoindentも同時に有効である必要があるよう）
set smartindent
" 暗い背景によく合う色にセット
set background=dark
" タブをスペース4文字とカウント
set tabstop=4
" アンドゥファイル作成
set undofile
" カーソル行をハイライトする
set cursorline
" ルーラ（行、列、現在位置を右下に表示）
set ruler
" インデント幅
set shiftwidth=2
" クリップボードへのコピー
set clipboard=unnamed,autoselect
" ヘルプの日本語化
set helplang=ja
" コードジャンプ
set tags=.tags;
" カーソルの左右移動で行末から次の行の行頭への移動を可能に
set whichwrap=b,s,h,l,<,>,[,],~
" コマンドモードの補完
set wildmenu
" undofileの出力先を一箇所に
set undodir=$HOME/.vim/undo
" swpファイル出力先
set directory=$HOME/.vim/swap
" バックアップファイル出力先
set backupdir=$HOME/.vim/backup
" 新しいウィンドウを右に開く
set splitright
" 新しいウィンドウを下に開く
set splitbelow
" 行の折り返し点を表示する
set showbreak=↪

"----------------------------------------
" appearance
"----------------------------------------
" カラースキームを変更
colorscheme jellybeans

"----------------------------------------
" key binding
"----------------------------------------
" LeaderキーをSpaceキーに設定
let g:mapleader = "\<space>"

"----------------------------------------
" key binding (normal-mode)
"----------------------------------------
" 分割されたウィンドウ間の移動
noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
" 表示行単位で上下移動するように
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk
" 実際の行単位で移動したい時用
nnoremap gj j
nnoremap gk koremap <c-l> <c-w><c-l>
" 日本語入力がオンのままでも使えるコマンド(Enterキーは必要)
nnoremap あ a
nnoremap い i
nnoremap う u
nnoremap お o
nnoremap っd dd
nnoremap っy yy
" NERDTreeを開く
nnoremap <silent><C-n> :NERDTreeToggle<CR>
" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]>
" .vimrcをすぐに開けるように
nnoremap <Leader>ev  :<C-u>edit $MYVIMRC<CR>
" ファイル保存
nnoremap <Leader>w :w<CR>
" ヘルプの参照
nnoremap <C-h> :<C-u>h<Space>
" Markdownプレビュー
nnoremap <Leader>md :PreviewMarkdown<CR>

"----------------------------------------
" key binding (insert-mode)
"----------------------------------------
" 対応する閉じ括弧や引用符を入力する
inoremap ' ''<esc>i
inoremap " ""<esc>i
inoremap ( ()<esc>i
inoremap { {}<esc>i
inoremap [ []<esc>i
" 入力モードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
" インサートモードを抜ける
inoremap <silent> jj <ESC>
" 日本語入力で”っj”と入力してもEnterキーで確定させればインサートモードを抜ける
inoremap <silent> っj <ESC>
