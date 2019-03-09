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
  call dein#add('Shougo/dein.vim')

  call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/neoinclude.vim')
  call dein#add('Shougo/vimproc.vim', {'build': 'make'})
  call dein#add('vim-scripts/taglist.vim')

  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('kien/ctrlp.vim')
  call dein#add('leafgarland/typescript-vim')
  call dein#add('majutsushi/tagbar')
  call dein#add('msanders/snipmate.vim')
  call dein#add('posva/vim-vue')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('scrooloose/nerdtree')
  call dein#add('thinca/vim-quickrun')
  call dein#add('thinca/vim-ref')
  call dein#add('tpope/vim-surround')
  call dein#add('w0rp/ale')

  call dein#end()
  call dein#save_state()
  " call dein#install()
endif
"}}}

filetype plugin indent on
syntax enable


" function! MyStatuslineSyntax() abort "{{{
"   let l:ret = ale#statusline#Status()
"   if 0 < len(l:ret)
"     highlight StatusLine cterm=NONE gui=NONE ctermfg=Black guifg=Black ctermbg=Magenta guibg=Magenta
"   elseif s:lineUpdate is# 1
"     highlight StatusLine cterm=NONE gui=NONE ctermfg=Black guifg=Black ctermbg=Grey guibg=Grey
"   endif
"   return l:ret
" endfunction "}}}

" function! MyStatuslinePaste() abort "{{{
"   if &paste is# 1
"     return '(paste)'
"   endif
"   return ''
" endfunction "}}}

set cmdheight=1
" set statusline=\ %t\ %{MyStatuslinePaste()}\ %m\ %r\ %h\ %w\ %q\ %{MyStatuslineSyntax()}%=%l/%L\ \|\ %Y\ \|\ %{&fileformat}\ \|\ %{&fileencoding}\
" customize statusline
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

nmap <silent> <Subleader>N <Plug>(ale_previous)
nmap <silent> <Subleader>n <Plug>(ale_next)
nmap <silent> <Subleader>a <Plug>(ale_toggle)

" ale {{{
let g:ale_echo_cursor              = 0
let g:ale_emit_conflict_warnings   = 0
let g:ale_history_enabled          = 0
let g:ale_history_log_output       = 0
let g:ale_lint_on_enter            = 0
let g:ale_lint_on_filetype_changed = 0
let g:ale_lint_on_text_changed     = 'never'
let g:ale_linters                  = {
\    'php': ['php']
\}
let g:ale_max_buffer_history_size        = 0
let g:ale_pattern_options_enabled        = 1
let g:ale_set_highlights                 = 1
let g:ale_set_signs                      = 1
let g:ale_warn_about_trailing_whitespace = 0
"}}}


" vim-ref {{{
" curl -O http://jp2.php.net/distributions/manual/php_manual_ja.tar.gz
" tar zxvf php_manual_ja.tar.gz -C $HOME/.vim/vim-ref
inoremap <silent><C-k> <C-o>:call<Space>ref#K('normal')<CR><ESC>
nmap <silent>K <Plug>(ref-keyword)
let g:ref_no_default_key_mappings = 1
let g:ref_cache_dir               = $HOME . '/.vim/vim-ref/cache'
let g:ref_detect_filetype         = {
\    'php': 'phpmanual'
\}
let g:ref_phpmanual_path = $HOME . '/.vim/vim-ref/php-chunked-xhtml'
let g:ref_use_cache      = 1
let g:ref_use_vimproc    = 1
"}}}

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
let g:neosnippet#snippets_directory = s:deinDir . '/repos/github.com/Shougo/neosnippet-snippets/neosnippets,~/.vim/snippets'
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
let g:ctrlp_root_markers = ['.editorconfig', 'package.json', 'composer.json', 'Gemfile']
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

