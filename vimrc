" first option
set nocompatible

" ----------------------------------------------------
" # load plugins with pathogen
" ----------------------------------------------------
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
filetype plugin indent on
" ----------------------------------------------------


" ----------------------------------------------------
" # set options
" ----------------------------------------------------
"
set history=1000
set hlsearch
set incsearch
set ignorecase
set number
set linebreak wrap nolist
set showbreak=↪
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set linespace=1
set laststatus=2
set encoding=utf-8
set shiftround
set tabstop=2
set expandtab
set showcmd
set mouse=a
set wildmode=longest,full
set wildmenu
set tabpagemax=15
set novisualbell
set noautochdir

" remove scrolls and everythink
set guioptions-=L
set guioptions-=R
set guioptions-=r
set guioptions-=m
set guioptions-=T

scriptencoding utf-8

syntax on

" font
set gfn=Menlo\ for\ Powerline:h12

" solarized colorscheme
set background=dark
let g:solarized_termcolors = 256
let g:solarized_visibility = 'high'
let g:solarized_contrast = 'high'
let g:solarized_termtrans = 1
colorscheme solarized

" syntastic
" my ruby path for 1.9.3
let g:syntastic_ruby_exec='~/.rbenv/shims/ruby'
let g:syntastic_enable_signs=1

" for autosave
set hidden
set nobackup
set noswapfile
set nowritebackup
set autoread
set noshowmode
"set autowrite
"set autowriteall

" ctrlp
let g:ctrlp_working_path_mode = 'c'
let g:ctrlp_custom_ignore = '\v[\/]\.(git)$'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" vim-sessions
let g:session_default_to_last = 1
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'
let g:session_autosave_periodic = 1
let g:session_default_name = 'default'
let g:session_command_aliases = 1

set rtp+=~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim

" indentLine
let g:indentLine_char = '⦙'
let g:indentLine_color_gui = '#4e4e4e'
let g:indentLine_showFirstIndentLevel = 0
let g:indentLine_indentLevel = 4

" store undo history
set undofile
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000

" ----------------------------------------------------
" # some functions
" ----------------------------------------------------
"

" Highlight current line in insert mode
autocmd InsertEnter * set cursorline!
autocmd InsertLeave * set nocursorline

" few colors
hi WildMenu guibg=IndianRed

" whitespaces cleaning
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/
function! TrimWhiteSpace()
  %s/\s*$//
  ''
endfunction

" fullscreen and search special binds for gui macvim
if has("gui_macvim")
  " grow to maximum horizontal width on entering fullscreen mode
  set fuopt+=maxhorz
  " free up Command-F
  macmenu &Edit.Find.Find\.\.\. key=<nop>
  " toggle fullscreen mode
  map <D-F> :set invfu<CR>
endif

" Restore cursor position to where it was before
augroup JumpCursorOnEdit
   au!
   autocmd BufReadPost *
            \ if expand("<afile>:p:h") !=? $TEMP |
            \   if line("'\"") > 1 && line("'\"") <= line("$") |
            \     let JumpCursorOnEdit_foo = line("'\"") |
            \     let b:doopenfold = 1 |
            \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
            \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
            \        let b:doopenfold = 2 |
            \     endif |
            \     exe JumpCursorOnEdit_foo |
            \   endif |
            \ endif
   " Need to postpone using "zv" until after reading the modelines.
   autocmd BufWinEnter *
            \ if exists("b:doopenfold") |
            \   exe "normal zv" |
            \   if(b:doopenfold > 1) |
            \       exe  "+".1 |
            \   endif |
            \   unlet b:doopenfold |
            \ endif
augroup END



" ----------------------------------------------------
" # syntax
" ----------------------------------------------------
"
" add .pill, .rabl with ruby
au BufRead,BufNewFile *.pill setf ruby
au BufRead,BufNewFile *.rabl setf ruby
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setf nginx | endif

" enable flavored-markdown
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END


" ----------------------------------------------------
" # keys mapping
" ----------------------------------------------------
"

" create splits
nmap <D-d> :vsplit<CR>
nmap <D-D> :split<CR>

" navigate with splits
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" zoom current split
nmap <D-O> <c-w>o

" resize split
nmap <D-H> :vertical resize -4<cr>
nmap <D-L> :vertical resize +4<cr>
nmap <D-J> :resize +4<cr>
nmap <D-K> :resize -4<cr>

" open project tree
silent! nmap <silent> <Leader>t :NERDTreeToggle<CR>

" clear whitespaces
silent! nmap <silent> <Leader>o :call TrimWhiteSpace()<CR>

" clear search
nmap <Leader>? :nohlsearch<CR>

" reload this config
nmap <Leader>reload :so $MYVIMRC<CR>

" open tabs
nmap <D-1> 1gt
nmap <D-2> 2gt
nmap <D-3> 3gt
nmap <D-4> 4gt
nmap <D-5> 5gt
nmap <D-6> 6gt
nmap <D-7> 7gt
nmap <D-8> 8gt
nmap <D-9> 9gt

" move blocks in visual
vmap <C-S-h> <gv
vmap <C-S-l> >gv
vmap <C-S-j> :m'>+<CR>gv=`<my`>mzgv`yo`z
vmap <C-S-k> :m'<-2<CR>gv=`>my`<mzgv`yo`z

" quick-switch to colorscheme - dark or light
nmap <Leader>dark :set background=dark<cr>
nmap <Leader>light :set background=light<cr>

" quick-switch with sessions
nmap <Leader>s :SaveSession!<cr>:OpenSession!<Space>

" open undo/redo history split
nmap <Leader>h :UndotreeToggle<cr>

" remap some commands...
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('w'):('Q'))
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
cnoreabbrev <expr> E ((getcmdtype() is# ':' && getcmdline() is# 'E')?('e'):('E'))
cnoreabbrev <expr> rm ((getcmdtype() is# ':' && getcmdline() is# 'rm')?('Remove'):('rm'))
cnoreabbrev <expr> rm! ((getcmdtype() is# ':' && getcmdline() is# 'rm!')?('Remove!'):('rm!'))
