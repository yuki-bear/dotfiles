" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'airblade/vim-gitgutter'
" Not to occur errors with gitgutter on windows
if has("win32unix")
  set shell=/bin/bash
endif
set updatetime=100 " update term. especially for gitgutter's refresh term
nnoremap <silent><C-G> :GitGutterLineHighlightsToggle<CR>


NeoBundle 'scrooloose/nerdtree'      " File drawer
nnoremap <silent><C-E> :NERDTreeToggle<CR>

NeoBundle 'scrooloose/nerdcommenter' " Mass commenting
NeoBundle 'msanders/snipmate.vim'    " Code snippets with tab completion
NeoBundle 'kien/ctrlp.vim'           " Fuzzy file finder
let g:ctrlp_show_hidden=1

NeoBundle 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


" system setting
set encoding=utf-8          " internal encoding
set fenc=utf-8              " default charset
set ff=unix                 " default line endings
set fileencodings=iso-2022-jp,cp932,sjis,euc-jp,utf-8 " encoding detection order for Japanese
set nobackup                " not make backup files
"set noswapfile              " not make swap files
set autoread                " reload editing file automatically when changes
set hidden                  " default line endings
set showcmd                 " show command in bottom bar
set visualbell              " disable beeping

" search setting
set ignorecase
set smartcase
set incsearch               " search as characters are entered
set hlsearch                " highlight matches
set wrapscan

" visual setting
syntax enable
set tabstop=4               " number of visual spaces per TAB
set shiftwidth=4            " indent size
set softtabstop=4           " number of spaces in tab when editing
set number                  " show line numbers
set title                   " show filename in title bar
set cursorline              " highlight current line
set showmatch               " highlight matching [{()}]
set laststatus=2            " show status line
set ruler                   " show cursor position
set list                    " show listchars
set listchars=tab:>-,trail:.,precedes:<,extends:> " appearance of system keys such as TAB

" customize statusline
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

set smartindent             " indent smartly
set wildmenu                " visual autocomplete for command menu
set wildmode=list:longest   " set filename correction better
set backspace=indent,eol,start " set backspace behaviour natural

let mapleader=","           " set leader comma

" key mapping
nnoremap j gj
nnoremap k gk
nnoremap gV `[v`]           " highlight last inserted text
inoremap jk <esc>           " jk is escape

" colorscheme
let &t_Co=256
try
  colorscheme molokai        " git@github.com:tomasr/molokai.git
  "colorscheme badwolf        " git@github.com:sjl/badwolf.git
catch /^Vim\%((\a\+)\)\=:E185/
endtry

