let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

set termguicolors

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
"Plug 'scrooloose/syntastic'
Plug 'w0rp/ale'
Plug 'tpope/vim-surround'
"Plug 'altercation/vim-colors-solarized'
Plug 'iCyMind/NeoSolarized'
Plug 'majutsushi/tagbar'
"Plug 'ervandew/supertab'
"Plug 'valloric/youcompleteme'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'moll/vim-node'
Plug 'mxw/vim-jsx'
Plug 'chemzqm/vim-jsx-improve'
Plug 'valloric/matchtagalways'
Plug 'elzr/vim-json'
Plug 'alampros/vim-styled-jsx'
Plug 'tpope/vim-repeat'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
"Plug 'sirver/ultisnips'
"Plug 'honza/vim-snippets'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'editorconfig/editorconfig-vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'wokalski/autocomplete-flow'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

syntax enable

colorscheme NeoSolarized
set background=dark

" Map , as <Leader>
let mapleader = ','
let g:mapleader = ','

let g:neosolarized_contrast="high"
let g:neosolarized_visibility="normal"
let g:neosolarized_hitrail=1

let NERDTreeShowHidden=1

let g:javascript_plugin_flow = 1

let g:jsx_ext_required = 0

let g:deoplete#enable_at_startup=1
let g:deoplete#enable_ignore_case=1
let g:deoplete#auto_complete_delay=100
call deoplete#custom#option('auto_complete_delay', 100)
call deoplete#custom#option('smart_case', v:false)
call deoplete#custom#option('min_pattern_length', 2)

let g:deoplete#enable_debug = 1
let g:deoplete#enable_profile = 1
call deoplete#enable_logging('DEBUG', $HOME.'/.vim/deoplete.log')

let g:nvim_typescript#type_info_on_hold = 1
let g:nvim_typescript#signature_complete = 1
let g:nvim_typescript#default_mappings = 1
let g:nvim_typescript#loc_list_item_truncate_after = -1

" ALE
let g:ale_enabled = 1
let g:ale_completion_enabled = 1
let g:ale_lint_delay = 100
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_fix_on_save = 1
let g:ale_open_list = 1
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_linters = {}
let g:ale_linters['javascript'] = ['eslint']
let g:ale_linters['typescript'] = ['tslint', 'tsserver', 'typecheck']

let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['eslint']
let g:ale_fixers['typescript'] = ['prettier', 'tslint']
let g:ale_fixers['javascript.jsx'] = ['eslint']
let g:ale_fixers['typescript.tsx'] = ['prettier', 'tslint']
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
"autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

" make YCM compatible with UltiSnips (using supertab)
"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
"let g:UltiSnipsExpandTrigger = "<c-u>"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"
"let g:UltiSnipsSnippetsDir=[$HOME.'/.vim/joonhocho/snips']
"let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/plugged/vim-snippets/UltiSnips']

let g:ctrlp_custom_ignore = '__generated__\|node_modules\|DS_Store\|.git'

let g:neosnippet#snippets_directory = $HOME.'/.vim/joonhocho/neosnippets'

let g:neosnippet#enable_completed_snippet = 1

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

" Edit neosnips
nnoremap <Leader>sn <C-w>v<C-w>l:NeoSnippetEdit<CR>
nnoremap <Leader>tst :TSType<CR>
nnoremap <Leader>tsr :TSRef<CR>
nnoremap <Leader>tsn :TSRename<CR>
nnoremap <Leader>tsd :TSDef<CR>
nnoremap <Leader>tsp :TSDefPreview<CR>
nnoremap <Leader>tso :TSDoc<CR>
nnoremap <Leader>tsi :TSImport<CR>

"-------------------------------------------------------------------------------
" Mappings
"-------------------------------------------------------------------------------

" Easier command
nnoremap ; :

" Repeat last command
nnoremap ;; @:

" Easier macro
nnoremap <space> @
nnoremap <space><space> @@

" Break long lines
"noremap j gj
"noremap k gk

" Switch 0 and ^
noremap 0 ^
noremap ^ 0

" Ignore case
command WQ wq
command Wq wq
command W w
command Q q
command E e

" Save/Quit
nnoremap <C-s> :w<CR>
nnoremap <C-z> :q<CR>
nnoremap <C-c> :bd<CR>
nnoremap Q :qa<CR>

" Search with standard regex
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

" Insert mode navigation
inoremap <C-d><C-d> <C-o>dd
inoremap <C-d><C-w> <C-o>dw
inoremap <C-d><C-e> <C-o>de
inoremap <C-d><C-b> <C-o>db
"inoremap <C-j> <C-o>j
"inoremap <C-k> <C-o>k
"inoremap <C-h> <C-o>h
"inoremap <C-l> <C-o>l
inoremap <C-w> <C-o>w
inoremap <C-b> <C-o>b
inoremap <C-a> <C-o>0
inoremap <C-e> <C-o>$

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nnoremap <M-j> :m+<CR>==
nnoremap <M-k> :m-2<CR>==
inoremap <M-j> <Esc>:m+<CR>==gi
inoremap <M-k> <Esc>:m-2<CR>==gi
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv
" for mac
nnoremap <A-j> :m+<CR>==
nnoremap <A-k> :m-2<CR>==
inoremap <A-j> <Esc>:m+<CR>==gi
inoremap <A-k> <Esc>:m-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Indent
nnoremap <M-l> >>
nnoremap <M-h> <<
inoremap <M-l> <C-t>
inoremap <M-h> <C-d>
vnoremap <M-l> >gv
vnoremap <M-h> <gv
" for mac
nnoremap <A-l> >>
nnoremap <A-h> <<
inoremap <A-l> <C-t>
inoremap <A-h> <C-d>
vnoremap <A-l> >gv
vnoremap <A-h> <gv

" Navigate split panes
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Resize split panes
nnoremap <Leader>= <C-w>=
nnoremap <Right> :vertical resize +1<CR>
nnoremap <Left> :vertical resize -1<CR>
nnoremap <Down> :resize +1<CR>
nnoremap <Up> :resize -1<CR>

" Clipboard Copy/Cut/Paste
nnoremap <M-y> "+yy
nnoremap <M-d> "+dd
nnoremap <M-p> "+P
inoremap <M-y> <C-o>"+yy
inoremap <M-d> <C-o>"+dd
inoremap <M-p> <C-o>"+P
vnoremap <M-y> "+y
vnoremap <M-d> "+x
vnoremap <M-p> "+gP

" Close current buffer
nnoremap <Leader>bd :bdelete<CR>
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bp :bprevious<CR>
nnoremap <Leader>bl :ls<CR>

" Close all buffers
nnoremap <Leader>ba :1,1000 bd<CR>

" MRU
nnoremap <Leader>mr :MRU<CR>

" Clear search highlights
nnoremap <Leader><Space> :nohlsearch<CR>

" Split open file
nnoremap <Leader>e :vsplit<Space>

" Split vertical panes and focus
nnoremap <Leader>v :lclose<CR><C-w>v<C-w>l

" Edit .vimrc
nnoremap <Leader>.v <C-w>v<C-w>l:e ~/.vimrc<CR>
nnoremap <Leader>.nv <C-w>v<C-w>l:e ~/.config/nvim/init.vim<CR>

" Set working directory
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>

" Ack
nnoremap <Leader>/ :Ack -i<Space>

" Clear undo history
nnoremap <Leader>un :ClearUndo<CR>

" Quickfix List
nmap <silent> <Leader>cc :call ToggleList("Quickfix List", 'c')<CR>
nnoremap <Leader>co :copen<CR>
nnoremap <Leader>cp :cprev<CR>
nnoremap <Leader>cn :cnext<CR>
nnoremap <Leader>cg :Lgo<CR>

" Location List
nmap <silent> <Leader>ll :call ToggleList("Location List", 'l')<CR>
nnoremap <Leader>lo :lopen<CR>
nnoremap <Leader>lp :lprev<CR>
nnoremap <Leader>ln :lnext<CR>
nnoremap <Leader>lg :Lgo<CR>

" Search and replace
vnoremap <silent> <Leader>r :call VisualSelection('replace', '')<CR>

" Beautify js, html, css
" autocmd FileType javascript noremap <buffer> <Leader>be :call JsBeautify()<CR>
" autocmd FileType html noremap <buffer> <Leader>be :call HtmlBeautify()<CR>
" autocmd FileType css noremap <buffer> <Leader>be :call CSSBeautify()<CR>

" Toggle Syntastic active/passive mode
"nnoremap <Leader>s :SyntasticCheck<CR>
" nnoremap <Leader>syt :SyntasticToggleMode<CR>

" Toggle syntax on/off
"nnoremap <Leader>ts :call ToggleSyntax()<CR>

nnoremap <Leader>fp :r! echo %:p<CR>
nnoremap <Leader>fn :r! echo %<CR>


"-------------------------------------------------------------------------------
" Editor Configurations
"-------------------------------------------------------------------------------

" Enable autocomplete in menu
set wildmenu

" Scroll fast
set ttyfast

" Scroll offset to cursor
set scrolloff=5

" Relative line numbers to cursor
set relativenumber

" Open vertical split on the right side
set splitright

" Highlight n-th column
set colorcolumn=80

" Global substitutions on lines
set gdefault

" Backspace navigation
set backspace=indent,eol,start

" Enable auto indentation
set autoindent

" Enable smart indentation
set smartindent

" Tab character width
set tabstop=2

" Smart auto indentation
set smarttab

" Auto indentation width, including >>, <<, ==
set shiftwidth=2

" Use 'softtabstop' spaces instead of tab
set expandtab

" Number of spaces to replace <TAB>/<BS>
set softtabstop=2

" Wrap lines
set wrap

" Highlight all matches for search
set hlsearch

" Real-time search
set incsearch

" Ignorecase for search
set ignorecase

" Smartcase matching
set smartcase

" Highlight matching brackets
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Don't redraw while executing macros for better performance
set lazyredraw

" Magic regular expressions
set magic

" Highlight whitespaces
set list listchars=eol:\ ,tab:\ \ ,trail:·,extends:>,precedes:<

" set cinoptions=>4,n-2,{2,^-2,:0,=2,g0,h2,t0,+2,(0,u0,w1,m1

" Auto refresh modified files
set autoread

" Show ruler
set ruler

" Show mode
set showmode

" Show command in status line
set showcmd

" Command bar height
set cmdheight=2

" Command line height
set laststatus=2

" Show line numbers
set number

" Line number width
set numberwidth=4

" History buffer size
set history=10000

" Line ending characters
set fileformat=unix

" Unicode encoding
set encoding=utf-8
set fileencoding=utf-8

" Enable hidden modified buffers
set hidden

" Disable backup files
set nobackup
set nowritebackup
set noswapfile

" Disable error/visual bells
set noerrorbells
set novisualbell
set vb t_vb=


"-------------------------------------------------------------------------------
" Helper Functions
"-------------------------------------------------------------------------------

" Toggle syntax on/off
function! ToggleSyntax()
    if exists("g:syntax_on")
        syntax off
    else
        syntax on
    endif
endfunction

" Clear the undo history
function! <SID>ForgetUndo()
    let old_undolevels = &undolevels
    set undolevels=-1
    exe "normal a \<BS>\<Esc>"
    let &undolevels = old_undolevels
    unlet old_undolevels
endfunction
command -nargs=0 ClearUndo call <SID>ForgetUndo()

" Used in VisualSelection()
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

" Search and replace
function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ack \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Used in ToggleList()
function! GetBufferList()
  redir =>buflist
  silent! ls
  redir END
  return buflist
endfunction

" Quickfix List / Location List
function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

" Remove trailing whitespaces
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc


"-------------------------------------------------------------------------------
" File Type Specific Configurations
"-------------------------------------------------------------------------------

" On save, remove trailing whitespaces
autocmd BufWrite *.js :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
autocmd BufWrite *.html :call DeleteTrailingWS()
autocmd BufWrite *.css :call DeleteTrailingWS()
autocmd BufWrite *.styl :call DeleteTrailingWS()
autocmd BufWrite *.less :call DeleteTrailingWS()
autocmd BufWrite *.py :call DeleteTrailingWS()

" autoindent smartindent expandtab tabstop=4 softtabstop=2 smarttab shiftwidth=4
" autocmd Filetype javascript setlocal tabstop=4 shiftwidth=4
" Indentation rules for file types
autocmd Filetype javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd Filetype html setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd Filetype styl setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd Filetype stylus setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd Filetype ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd Filetype yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd Filetype jade setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

filetype plugin indent on
syntax on
