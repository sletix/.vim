"set nocompatible
"set backspace=indent,eol,start

"store lots of :cmdline history
set history=1000
"set showmode    "show current mode down the bottom
set hlsearch    "hilight searches by default
set incsearch
set number      "add line numbers
"set showbreak=...
"set wrap linebreak nolist
colorscheme BusyBee "Night
"colorscheme habilight "Sun
set sw=2
set sts=2
set gfn=Monaco:h11

"Keys for splits
nmap <D-d> :vsplit<CR>
nmap <D-D> :split<CR>
nmap <Tab>cl :nohlsearch<CR>
"turn off needless toolbar on gvim/mvim
set guioptions-=T

"add some line space for easy reading
set linespace=4

"disable visual bell
"set visualbell t_vb=

"disable
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

"key mapping for window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"indent settings
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

"turn on syntax highlighting
syntax on

"hide buffers when not displayed
set hidden

silent! nmap <silent> <Leader>t :NERDTreeToggle<CR>

"jump to last cursor position when opening a file
"dont do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
    if &filetype !~ 'commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal! g`\""
            normal! zz
        endif
    end
endfunction

"key mapping for tab navigation
nmap <Tab> gt
nmap <S-Tab> gT

"Key mapping for textmate-like indentation
nmap <D-[> << <D-r>
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

"Pathogen
filetype off

call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

filetype plugin indent on
"Whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

function TrimWhiteSpace()
  %s/\s*$//
  ''
:endfunction

silent! nmap <silent> <Leader>o :call TrimWhiteSpace()<CR>

"Enable syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1

"Filename in statusline
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" Open tab by number
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-8> 8gt
map <D-9> 9gt

" Move visually selected blocks of text
vmap <C-S-h> <gv
vmap <C-S-l> >gv
vmap <C-S-j> :m'>+<CR>gv=`<my`>mzgv`yo`z
vmap <C-S-k> :m'<-2<CR>gv=`>my`<mzgv`yo`z

" No swap file
set noswapfile

" Syntax
au BufRead,BufNewFile *.pill setf ruby
au BufRead,BufNewFile *.rabl setf ruby
