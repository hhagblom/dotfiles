" Plug ins {{{
"
"
call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
"Plug 'mdempsky/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
" Plug 'elxir-editors/vim-elixir'
" Plug 'AndrewRadev/splitjoin.vim'
" Plug 'SirVer/ultisnips'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'chriskempson/base16-vim'
"Plug 'Shougo/neocomplete.vim'
"Plug 'Valloric/YouCompleteMe'
" Plug 'alessandroyorba/despacio'
" Plug 'aklt/plantuml-syntax'
Plug 'gabrielelana/vim-markdown'

Plug 'reedes/vim-pencil'
Plug 'junegunn/goyo.vim'
" Plug 'junegunn/limelight.vim'

"Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'

Plug 'rking/ag.vim'
Plug 'davidhalter/jedi-vim'
call plug#end()
" }}}
set shell=bash
" {{{  Airline fonts
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

"" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

"" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"" tabline
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
" }}}

" {{{ Theme settings
"

set background=dark
syntax enable
if $TERM =~ '^xterm\\|rxvt\\|screen'
    set t_Co=256
endif

" let base16colorspace=256
"colorscheme base16-default-dark
colorscheme monokai
" }}}
" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=" "

let maplocalleader=","

" let g:agprg="<custom-ag-path-goes-here> --column"
" Don’t add empty newlines at the end of files
set binary
" set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Highlight current line
set cursorline


"let &t_SI .= "\<Esc>[6 q"
"let &t_SR .= "\<Esc>[4 q"
  "" solid block

"let &t_EI .= "\<Esc>[2 q"
if &term == 'xterm-256color'
  " solid underscore
  let &t_SI .= "\<Esc>[6 q"
  let &t_SR .= "\<Esc>[4 q"
  " solid block

  let &t_EI .= "\<Esc>[2 q"
  " 1 or 0 -> blinking block
  " 3 -> blinking underscore
  " Recent versions of xterm (282 or above) also support
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar
  autocmd VimLeave * silent !echo -ne "\033]112\007"
endif

augroup Cursor
" cursorcolumn if needed
au WinLeave * set nocursorline
au VimEnter,WinEnter,BufWinEnter * set cursorline
augroup END

" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
" set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
" if exists("&relativenumber")
set relativenumber
"	au BufReadPost * set relativenumber
" endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Make tabs as wide as two spaces
set expandtab
set tabstop=4
set shiftwidth=4

" Indent stuff
set smartindent
set autoindent

"Map code completion to , + tab
imap <leader><tab> <C-x><C-o>

" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>

nnoremap [B :bfirst<cr>
nnoremap ]B :blast<cr>

nnoremap [a :previous<cr>
nnoremap ]a :next<cr>

nnoremap [A :first<cr>
nnoremap ]A :last<cr>

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown

    augroup stripWhitespace
        autocmd BufWritePre * :call StripWhitespace()
    augroup END
endif

inoremap fd <Esc>
vnoremap fd <Esc>

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
nnoremap <leader>c :Bclose<CR>

" Automatically show type info after 100 ms
set updatetime=100
"
" {{{ Neocomplete
let g:neocomplete#enable_at_startup = 1

" :inoremap <expr> j pumvisible() ? '<C-n>' : 'j'
" :inoremap <expr> k pumvisible() ? '<C-p>' : 'k'
" Move up and down in autocomplete with <c-j> and <c-k>
" Close the popup with space
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" inoremap <expr><CR> pumvisible() ? neocomplete#close_popup() : "\<CR>"

" }}}
" :autocmd InsertEnter,InsertLeave * set cul!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Try to find
if &term =~ '^xterm\\|rxvt'
  " solid underscore
  let &t_SI .= "\<Esc>[4 q"
	" solid block
  let &t_EI .= "\<Esc>[2 q"
  " 1 or 0 -> blinking block
  " 3 -> blinking underscore
  " Recent versions of xterm (282 or above) also support
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar
endif

"{{{ Start Limelight settings
nmap <Leader>l <Plug>(Limelight)
xmap <Leader>l <Plug>(Limelight)

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

" End Limelight settings }}}

filetype plugin on       " may already be in your .vimrc
filetype indent on

augroup pencil
	  autocmd!
	  autocmd FileType markdown,mkd call pencil#init()
	  autocmd FileType text         call pencil#init()
	  autocmd FileType rst          call pencil#init()
augroup END
" PencilSoft is the one I should be using
let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'

" autocmd BufWritePre *.py :call StripWhitespace()<CR>

:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>

map <C-T> :NERDTreeToggle<CR>

" {{{ vim-go setup

let g:go_auto_type_info = 0
let g:go_test_timeout = '20s'

"let g:go_auto_sameids = 0

let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
" Run the Go MetaLinter on save
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 0
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck']
let g:go_highlight_build_constraints = 1
" Potentially the setting below slows down vim
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

augroup go_cmds

autocmd FileType go setlocal omnifunc=go#complete#Complete
autocmd FileType go set noexpandtab

autocmd FileType go nmap <localleader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <localleader>t  <Plug>(go-test)
autocmd FileType go nmap <localleader>f  <Plug>(go-test-func)
autocmd FileType go nmap <localleader>rn <Plug>(go-rename)
autocmd FileType go nmap <localleader>rr <Plug>(go-run)
autocmd FileType go nmap <localleader>c  <Plug>(go-coverage-toggle)
autocmd FileType go nmap <localleader>T  <Plug>(go-alternate)
autocmd FileType go nmap <localleader>dc <Plug>(go-decls)
autocmd FileType go nmap <localleader>i <Plug>(go-info)

autocmd FileType go nmap <localleader>dd <Plug>(go-def)
autocmd FileType go nmap <localleader>dp <Plug>(go-def-pop)

autocmd FileType go nmap <localleader>ds <Plug>(go-def-split)
autocmd FileType go nmap <localleader>dv <Plug>(go-def-vertical)
autocmd FileType go nmap <localleader>dt <Plug>(go-def-tab)
autocmd FileType go nmap <localleader>fc <Plug>(go-callers)

autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

"autocmd Filetype go setlocal foldmethod=syntax
"autocmd Filetype go setlocal foldnestmax=1


augroup END
" }}}

" {{{ Python Setup
augroup python_cmds
    autocmd Filetype python setlocal shiftwidth=2 tabstop=2 expandtab
    au BufNewFile,BufRead *.py
        \ setlocal tabstop=4
        \ softtabstop=4
        \ shiftwidth=4
        \ textwidth=79
        \ expandtab
        \ autoindent
        \ fileformat=unix
" sw=2 sts=2 et
 augroup END
" }}}

augroup web_cmds
    au BufNewFile,BufRead *.js,*.html,*.css,*.yaml,*.yml
            \ setlocal tabstop=2
            \ softtabstop=2
            \ shiftwidth=2
augroup END

"augroup yaml
"autocmd Filetype yaml setlocal foldmethod=marker
"augroup END

" This is a fold expression for mails
"	:set foldmethod=expr
"	:set foldexpr=strlen(substitute(substitute(getline(v:lnum),'\\s','',\"g\"),'[^>].*','',''))

" {{{ Fold Setting

" For this fold use mode marker
setlocal foldmethod=marker
" Show a visual indication of folds
"set foldcolumn=4
" set foldopen=0
" Automatically close fold when moving outside of block
set foldclose=all
set foldnestmax=1
" }}}

set splitright " Split new files to the right
set splitbelow " Split new files below
set autowrite " Automatically write when leaving buffer
set autoread " Automatically pick up filesystem changes
set ruler

au FocusLost * :wa              " Set vim to save the file on focus out.
set noshowmatch                 " Do not show matching brackets by flickering
set noshowmode                  " We show the mode with airline or lightline
set incsearch                   " Shows the match while typing

set smartcase

" speed up syntax highlighting
set nocursorcolumn
set nocursorline

syntax sync minlines=256
set synmaxcol=300
set re=1

" Make Vim to handle long lines nicely.
set wrap
set textwidth=79
set formatoptions=qrn1
" set colorcolumn=80

set smarttab " Do smart tabbing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ 'vendor' :'\v[\/]vendor$'
  \ }
" Commenting blocks of code.
"autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
"autocmd FileType sh,ruby,python   let b:comment_leader = '# '
"autocmd FileType conf,fstab       let b:comment_leader = '# '
"autocmd FileType tex              let b:comment_leader = '% '
"autocmd FileType mail             let b:comment_leader = '> '
"autocmd FileType vim              let b:comment_leader = '" '
"noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
"noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
