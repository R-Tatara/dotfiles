"----------------------------------------
" 基本設定
"----------------------------------------
set nocompatible

"----------------------------------------
" 文字
"----------------------------------------
" 読み込み時の文字コードの設定
set encoding=utf-8
" Vim Script内でマルチバイトを使う場合の設定
scriptencoding utf-8
" 保存時の文字コード
set fileencoding=utf-8
" 読み込み時の文字コードの自動判別. 左側優先
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
" 改行コードの自動判別. 左側優先
set fileformats=unix,dos,mac
" 全角文字専用の設定
set ambiwidth=double

"----------------------------------------
" ファイル設定
"----------------------------------------
" ファイルを上書きする前にバックアップを作ることを無効化
set nowritebackup
" ファイルを上書きする前にバックアップを作ることを無効化
set nobackup
" スワップファイルを作成しない
set noswapfile
" vim の矩形選択で文字が無くても進める
set virtualedit=block

"----------------------------------------
" 表示設定
"----------------------------------------
" エラーメッセージの表示時にビープを鳴らさない
set noerrorbells
" Windowsでパスの区切り文字をスラッシュで扱う
set shellslash
" 対応する括弧やブレースを表示
set showmatch matchtime=1
" インデント方法の変更
set cinoptions+=:0
" メッセージ表示欄を2行確保
set cmdheight=2
" 省略されずに表示
set display=lastline
" タブ文字を CTRL-I で表示し、行末に $ で表示する
set list
" 行末のスペースを可視化
set listchars=tab:^\ ,trail:~
" コメントの色を水色
hi Comment ctermfg=3
" ツールバーを非表示にする
set guioptions-=T
" yでコピーした時にクリップボードに入る
set guioptions+=a
" メニューバーを非表示にする
set guioptions-=m
" 右スクロールバーを非表示
set guioptions+=R
" 検索にマッチした行以外を折りたたむ(フォールドする)機能
set nofoldenable
" タイトルを表示
set title
" ヤンクでクリップボードにコピー
set clipboard=unnamed,autoselect
" Escの2回押しでハイライト消去
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
" シンタックスハイライト
syntax on
" すべての数を10進数として扱う
set nrformats=

"----------------------------------------
" ステータスライン
"----------------------------------------
" ステータスラインを常に表示
set laststatus=2
" 現在のモードを表示
set showmode
" 打ったコマンドをステータスラインの下に表示
set showcmd
" ステータスラインの右側にカーソルの位置を表示する
set ruler

"----------------------------------------
" コマンドモード
"----------------------------------------
" wildmenuオプションを有効(vimバーからファイルを選択できる)
set wildmenu
" コマンドラインの履歴を1000件保存
set history=1000

"----------------------------------------
" カーソル移動
"----------------------------------------
" 行をまたいで移動
set whichwrap=b,s,h,l,<,>,[,],~
" 行番号の表示
set number
" カーソルラインをハイライト
set cursorline
" 行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソルを移動する
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
" 挿入モードでバックスペースで削除できるようにする
set backspace=indent,eol,start

"----------------------------------------
" タブ・インデント
"----------------------------------------
" 入力モードでTab押下時に半角スペースを挿入
set expandtab
" ファイル内にあるタブ文字の表示幅
set tabstop=4
" タブキー押下時に挿入される文字幅
set softtabstop=4
" 改行時に前の行のインデントを継続
set autoindent
" 改行時に前の行の構文に合わせて次の行のインデントを増減
set smartindent
" インデント幅
set shiftwidth=4

"----------------------------------------
" 文字列検索
"----------------------------------------
" インクリメンタル検索 (検索ワードの最初の文字を入力した時点で検索が開始)
set incsearch
" 検索するときに大文字小文字を区別しない
set ignorecase
" 小文字で検索すると大文字と小文字を無視して検索
set smartcase
" 検索結果をハイライト表示
set hlsearch
" _検索がファイル末尾まで進んだら、ファイル先頭から再び検索
set wrapscan
" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

"----------------------------------------
" 括弧・タグの対応
"----------------------------------------
" 対応する括弧を強調表示
set showmatch
" Vimの%を拡張する
source $VIMRUNTIME/macros/matchit.vim

"----------------------------------------
" マウスの有効化
"----------------------------------------
if has('mouse')
    set mouse=a
    if has('mouse_sgr')
        set ttymouse=sgr
    elseif v:version > 703 || v:version is 703 && has('patch632')
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    endif
endif

"----------------------------------------
" My setting
"----------------------------------------
" auto reload .vimrc
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

" auto comment off
augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
augroup END

" HTML/XML閉じタグ自動補完
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

" 編集箇所のカーソルを記憶
if has("autocmd")
  augroup redhat
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END
endif

colorscheme molokai
set t_Co=256