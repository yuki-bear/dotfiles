" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

let s:deinDir    = ! exists('s:deinDir') ? $HOME . '/.vim/dein.vim' : s:deinDir
let &runtimepath = &runtimepath . ',' . s:deinDir . '/repos/github.com/Shougo/dein.vim'
" dein.vim {{{
if dein#load_state(s:deinDir)
  call dein#begin(s:deinDir)

  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('tpope/vim-surround')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('scrooloose/nerdtree')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('posva/vim-vue')
  call dein#add('msanders/snipmate.vim')
  call dein#add('kien/ctrlp.vim')
  call dein#add('majutsushi/tagbar')
  call dein#add('leafgarland/typescript-vim')

  call dein#end()
  call dein#save_state()
endif
"}}}
" :call dein#install()

filetype plugin indent on
syntax enable

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

"set snippet file dir
let g:neosnippet#snippets_directory = s:deinDir . '/repos/github.com/Shougo/neosnippet-snippets/neosnippets/,~/.vim/snippets'

" Not to occur errors with gitgutter on windows
set updatetime=100 " update term. especially for gitgutter's refresh term
if has("win32unix")
  set shell=/bin/bash
endif
if has('windows')
  let g:gitgutter_git_executable = 'git' "for gvim on windows
endif
nnoremap <silent><C-G> :GitGutterLineHighlightsToggle<CR>


" nerdtree
nnoremap <silent><C-E> :NERDTreeToggle<CR>

" nerdcommenter
let g:NERDSpaceDelims = 1            " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1        " Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left'      " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDAltDelims_java = 0         " Set a language to use its alternate delimiters by default
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } } " Add your own custom formats or override the defaults
let g:NERDCommentEmptyLines = 0      " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 0 " Enable trimming of trailing whitespace when uncommenting
map <silent><C-N> <plug>NERDCommenterToggle

" vim-vue
autocmd FileType vue syntax sync fromstart

" ctrlp
let g:ctrlp_show_hidden = 1
let g:ctrlp_max_height = 20
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_lazy_update = 1
let g:ctrlp_root_markers = ['package.json', 'composer.json', 'Gemfile']
if has('windows')
  set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
else
  set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
endif
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$|\v[\/](build|storage|templates_c)$',
  \ 'file': '\v\.(log|exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" tagbar
nmap <F8> :TagbarToggle<CR>

" show tag list if there are two or more candidates
nnoremap <C-]> g<C-]>

" typescript-vim
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''


" system setting
set encoding=utf-8          " internal encoding
set fenc=utf-8              " default charset
set ff=unix                 " default line endings
set fileencodings=utf8,iso-2022-jp,cp932,sjis,euc-jp " encoding detection order for Japanese
set backup
set swapfile
if isdirectory(expand("~/.vim/.backup/"))
    set backupdir=~/.vim/.backup/
endif
if isdirectory(expand("~/.vim/.undo/"))
    set undodir=~/.vim/.undo/
endif
if isdirectory(expand("~/.vim/.swp/"))
    set directory=~/.vim/.swp/
endif
set autoread                " reload editing file automatically when changes
set hidden                  " default line endings
set showcmd                 " show command in bottom bar
set visualbell              " disable beeping
set lazyredraw              " not to draw movings of macros
set clipboard=unnamed

" search setting
set ignorecase
set smartcase
set incsearch               " search as characters are entered
set hlsearch                " highlight matches
set wrapscan

" visual setting
set tabstop=4               " number of visual spaces per TAB
set shiftwidth=4            " indent size
set softtabstop=4           " number of spaces in tab when editing
set expandtab               " insert spaces when type tab key
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
" highlight last inserted text
nnoremap gV `[v`]
" jk is escape
inoremap <silent> jk <esc>

" colorscheme
let &t_Co=256
try
  " colorscheme molokai        " git@github.com:tomasr/molokai.git
  " colorscheme badwolf        " git@github.com:sjl/badwolf.git
  colorscheme gruvbox        " git@github.com:morhetz/gruvbox.git
catch /^Vim\%((\a\+)\)\=:E185/
endtry

