set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'jacoborus/tender.vim'
Plugin 'Shougo/deoplete.nvim'
Plugin 'itchyny/lightline.vim'
if !has('nvim')
  Plugin 'roxma/nvim-yarp'
  Plugin 'roxma/vim-hug-neovim-rpc'
endif

Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet-snippets'


call vundle#end()            " required
filetype plugin indent on    " required



"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/suiyiting/.vim/bundle/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/suiyiting/.vim/bundle')
  call dein#begin('/Users/suiyiting/.vim/bundle')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/suiyiting/.vim/bundle/repos/github.com/Shougo/dein.vim')
  call dein#add('scrooloose/nerdtree')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')
  

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif



set shell=/bin/zsh
set number
set cmdheight=2
set laststatus=1
" set cinoptions+=:0
set history=10000
hi Comment ctermfg=3
set title
" set nrformats=
set expandtab
set tabstop=4
set shiftwidth=4
set laststatus=2

set wildmenu

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

"----------ここはよくわかっていない-------------
" For Neovim 0.1.3 and 0.1.4
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" ----------------------------------------------

" Theme
syntax enable
colorscheme jellybeans

if !has('gui_running')
  set t_Co=256
endif

" Comannds
inoremap <silent> jj <ESC>:<C-u>w<CR>
inoremap <silent> ZZ :wq

nnoremap <silent><C-n> :NERDTreeToggle<CR>

" autocmd VimEnter * execute 'NERDTree'

augroup PHP
  autocmd!
  autocmd FileType php set makeprg=php\ -l\ %
  " php -lの構文チェックでエラーがなければ「No syntax errors」の一行だけ出力される
  autocmd BufWritePost *.php silent make | if len(getqflist()) != 1 | copen | else | cclose | endif
augroup END

" なくてもいいけどあった方がより便利
syntax on

set noautoindent  " autoindent を OFF
set nosmartindent  " smartindent を OFF
set nocindent  " cindent を OFF

set completeopt=menuone,noinsert
