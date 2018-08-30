" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

if isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
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
  set updatetime=100 " update term. especially for gitgutter's refresh term
  if has("win32unix")
    set shell=/bin/bash
  endif
  if has('windows')
    let g:gitgutter_git_executable = 'git' "for gvim on windows
  endif
  nnoremap <silent><C-G> :GitGutterLineHighlightsToggle<CR>


  NeoBundle 'scrooloose/nerdtree'      " File drawer
  nnoremap <silent><C-E> :NERDTreeToggle<CR>

  NeoBundle 'scrooloose/nerdcommenter' " Mass commenting
  let g:NERDSpaceDelims = 1            " Add spaces after comment delimiters by default
  let g:NERDCompactSexyComs = 1        " Use compact syntax for prettified multi-line comments
  let g:NERDDefaultAlign = 'left'      " Align line-wise comment delimiters flush left instead of following code indentation
  let g:NERDAltDelims_java = 0         " Set a language to use its alternate delimiters by default
  let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } } " Add your own custom formats or override the defaults
  let g:NERDCommentEmptyLines = 0      " Allow commenting and inverting empty lines (useful when commenting a region)
  let g:NERDTrimTrailingWhitespace = 0 " Enable trimming of trailing whitespace when uncommenting
  map <silent><C-N> <plug>NERDCommenterToggle

  NeoBundle 'msanders/snipmate.vim'    " Code snippets with tab completion
  NeoBundle 'kien/ctrlp.vim'           " Fuzzy file finder
  let g:ctrlp_show_hidden = 1
  let g:ctrlp_max_height = 20
  let g:ctrlp_clear_cache_on_exit = 0
  let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
  let g:ctrlp_lazy_update = 1
  let g:ctrlp_root_markers = ['package.json', 'composer.json']
  if has('windows')
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*     " MacOSX/Linux
  else
    set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*\\vendor\\*  " Windows
  endif
  let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$\|\v[\/](vendor)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'some_bad_symbolic_links',
    \ }
  NeoBundle 'majutsushi/tagbar'
  nmap <F8> :TagbarToggle<CR>

  NeoBundle 'leafgarland/typescript-vim'
  let g:typescript_compiler_binary = 'tsc'
  let g:typescript_compiler_options = ''

  call neobundle#end()

  " Required:
  filetype plugin indent on

  " If there are uninstalled bundles found on startup,
  " this will conveniently prompt you to install them.
  NeoBundleCheck
endif


" system setting
set encoding=utf-8          " internal encoding
set fenc=utf-8              " default charset
set ff=unix                 " default line endings
set fileencodings=iso-2022-jp,cp932,sjis,euc-jp,utf-8 " encoding detection order for Japanese
set backup
set swapfile
set backupdir=~/.vim/.backup/
"set undodir=~/.vim/.undo/
set directory=~/.vim/.swp/
set autoread                " reload editing file automatically when changes
set hidden                  " default line endings
set showcmd                 " show command in bottom bar
set visualbell              " disable beeping
set lazyredraw              " not to draw movings of macros

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

