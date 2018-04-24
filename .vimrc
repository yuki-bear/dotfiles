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

NeoBundle 'scrooloose/nerdtree'      " File drawer
nnoremap <silent><C-e> :NERDTreeToggle<CR>

NeoBundle 'scrooloose/nerdcommenter' " Mass commenting
NeoBundle 'msanders/snipmate.vim'    " Code snippets with tab completion
NeoBundle 'kien/ctrlp.vim'           " Fuzzy file finder

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

set fenc=utf-8
set ff=unix
set nobackup
set noswapfile
set autoread
set hidden
set showcmd

set number
set cursorline
set virtualedit=onemore
set smartindent
set visualbell
set showmatch
set laststatus=2
set wildmode=list:longest
nnoremap j gj
nnoremap k gk

set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
