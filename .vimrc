" 初期設定
set encoding=utf-8
scriptencoding utf-8

" 文字コード
set fileencoding=utf-8
set ambiwidth=double

" インデント
set expandtab
set tabstop=2
set softtabstop=2
set autoindent
" set smartindent
set shiftwidth=2

" 検索
set incsearch
set hlsearch
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch<CR>

" カーソル
set whichwrap=b,s,h,l<,>,[,],~
set number
set cursorline
set backspace=indent,eol,start
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

" タグジャンプ
set showmatch
source $VIMRUNTIME/macros/matchit.vim

" コマンド補完
set wildmenu
set history=5000

" キーマッピング
imap >> \|><Space>

" マウス有効化
if has('mouse')
  set mouse=a
  if has('mouse_sgr')
    set ttymouse=xterm2
  endif
endif

" ペースト
let &t_SI .= "\e[?2004h"
let &t_EI .= "\e[?2004l"
let &pastetoggle = "\e[201~"
function XTermPasteBegin(ret)
  set paste
  return a:ret
endfunction
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")

" *.mjsをjsとして読み込み
au BufNewFile,BufRead *.mjs set filetype=javascript

" 括弧補完
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap [ []<Left>

" クオーテーション補完
inoremap ' ''<Left>
inoremap " ""<Left>

" NeoBundle設定
set runtimepath^=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" Vimプラグイン
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tomasr/molokai'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'tacahiroy/ctrlp-funky'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'elixir-editors/vim-elixir'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'moll/vim-node'

call neobundle#end()

NeoBundleCheck

filetype plugin indent on

" カラースキーム
if neobundle#is_installed('molokai')
  colorscheme molokai
endif
syntax enable

" Syntastic
let g:syntastic_enable_signs = 1
let g:syntastic_always_populete_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" ステータスライン
set laststatus=2
set showmode
set showcmd
set ruler

" CtrlP
let g:ctrlp_match_window = 'order:ttb,min:20,max:20,results:100'
let g:ctrlp_show_hidden = 1
let g:ctrlp_types = ['fil']
let g:ctrlp_extensions = ['funky']
command! CtrlpCommandLine call ctrlp#init(ctrlp#commandline#id())
let g:ctrlp_funky_matchtype = 'path'
