set nocompatible
" required for vundle
filetype off

set rtp+=~/.vim/bundle/vundle/
set rtp+=/usr/homebrew/opt/fzf/
call vundle#rc()

" speed up
set lazyredraw
set ttyfast

" for auto reload file if it changes
set autoread
au CursorHold * checktime

" --------------------------------------------------
" list of plugins from github
" --------------------------------------------------
"

" copilot + codecompanion
Bundle 'nvim-lua/plenary.nvim'
Bundle 'nvim-treesitter/nvim-treesitter'
Bundle 'MeanderingProgrammer/render-markdown.nvim'
Bundle 'OXY2DEV/markview.nvim'
Bundle 'echasnovski/mini.diff'
Bundle 'olimorris/codecompanion.nvim'
Bundle 'github/copilot.vim'

Bundle 'slim-template/vim-slim.git'
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'tpope/vim-rails'
Bundle 'kchmck/vim-coffee-script'
"Bundle 'tpope/vim-endwise'
"Bundle 'tpope/vim-eunuch'
Bundle 'jtratner/vim-flavored-markdown'
Bundle 'tpope/vim-haml'
Bundle 'pangloss/vim-javascript'
"Bundle 'topfunky/PeepOpen-EditorSupport', {'rtp': 'vim-peepopen'}
Bundle 'vim-ruby/vim-ruby'
Bundle 'airblade/vim-rooter'
"Bundle 'xolox/vim-session'
"Bundle 'tope/vim-surround'
"Bundle 'orntrace/bufexplorer'
"Bundle 'altercation/vim-colors-solarized'
Bundle 'shaunsingh/solarized.nvim'
"Bundle 'ericbn/vim-solarized'
Bundle 'shaunsingh/nord.nvim'
Bundle 'shaunsingh/moonlight.nvim'
Bundle 'EdenEast/nightfox.nvim'
"Bundle 'kien/ctrlp.vim'
Bundle 'Raimondi/delimitMate'
"Bundle 'nono/vim-handlebars'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/syntastic'
Bundle 'godlygeek/tabular'
"Bundle 'mbbill/undotree'
Bundle 'mileszs/ack.vim'
Bundle 'troydm/zoomwintab.vim'
Bundle 'junegunn/fzf', { 'dir': '/usr/homebrew/opt/fzf' }
Bundle 'junegunn/fzf.vim'
Bundle 'junegunn/goyo.vim'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'elixir-editors/vim-elixir'
"Bundle 'Floobits/floobits-vim'
"Bundle 'vim-scripts/cmdalias.vim'
"Bundle 'vim-scripts/ingo-library'
"Bundle 'vim-scripts/ProportionalResize.git'
"Bundle 'airblade/vim-gitgutter'
"Bundle 'leafo/moonscript-vim'
"Bundle 'rust-lang/rust.vim'
Bundle 'rhysd/vim-crystal'
"Bundle 'neoclide/coc.nvim'
Bundle 'mxw/vim-jsx'
"Bundle 'keith/swift.vim'

" setup codecompanion with copilot
" new models: GET https://api.individual.githubcopilot.com/models:
"
"id: gpt-4.1, premium: false, state: "enabled", context: 128000, output: 16384, prompt: 128000
"id: gpt-5-mini, premium: false, state: "enabled", context: 264000, output: 64000, prompt: 128000
"id: gpt-5, premium: true, state: "enabled", context: 264000, output: 64000, prompt: 128000
"id: gpt-3.5-turbo, premium: false, state: nil, context: 16384, output: 4096, prompt: 16384
"id: gpt-3.5-turbo-0613, premium: false, state: nil, context: 16384, output: 4096, prompt: 16384
"id: gpt-4o-mini, premium: false, state: nil, context: 128000, output: 4096, prompt: 64000
"id: gpt-4o-mini-2024-07-18, premium: false, state: nil, context: 128000, output: 4096, prompt: 64000
"id: gpt-4, premium: false, state: nil, context: 32768, output: 4096, prompt: 32768
"id: gpt-4-0613, premium: false, state: nil, context: 32768, output: 4096, prompt: 32768
"id: gpt-4o, premium: false, state: nil, context: 128000, output: 4096, prompt: 64000
"id: gpt-4o-2024-11-20, premium: false, state: nil, context: 128000, output: 16384, prompt: 64000
"id: gpt-4o-2024-05-13, premium: false, state: nil, context: 128000, output: 4096, prompt: 64000
"id: gpt-4-o-preview, premium: false, state: nil, context: 128000, output: 4096, prompt: 64000
"id: gpt-4o-2024-08-06, premium: false, state: nil, context: 128000, output: 16384, prompt: 64000
"id: o3-mini-paygo, premium: true, state: nil, context: 200000, output: 100000, prompt: 64000
"id: grok-code-fast-1, premium: false, state: "enabled", context: 128000, output: 64000, prompt: 128000
"id: claude-3.5-sonnet, premium: true, state: "enabled", context: 90000, output: 8192, prompt: 90000
"id: claude-sonnet-4, premium: true, state: "enabled", context: 216000, output: 16000, prompt: 128000
"id: claude-sonnet-4.5, premium: true, state: "enabled", context: 144000, output: 16000, prompt: 128000
"id: claude-haiku-4.5, premium: true, state: "enabled", context: 144000, output: 16000, prompt: 128000
"id: gemini-2.5-pro, premium: true, state: "enabled", context: 128000, output: 64000, prompt: 128000
"id: gpt-4.1-2025-04-14, premium: false, state: "enabled", context: 128000, output: 16384, prompt: 128000
"
lua << EOF
  -- setup codecompanion with copilot adapter
  require("codecompanion").setup({
    adapters = {
      http = {
        copilot = function()
          return require("codecompanion.adapters").extend("copilot", {
            schema = {
              model = {
                -- claude -- all premium
                -- default = "claude-3.5-sonnet",
                -- default = "claude-sonnet-4",
                -- default = "claude-sonnet-4.5",
                -- default = "claude-haiku-4.5",
                --

                -- gpt
                -- default = "gpt-4.1",
                -- default = "gpt-5-mini",
                -- default = "gpt-5", -- premium
                --

                -- other
                default = "grok-code-fast-1",
                -- default = "o3-mini-paygo", -- premium
                -- default = "gemini-2.5-pro", -- premium
              },
            },
          })
        end,
      },
    },
    strategies = {
      chat = { adapter = "copilot" },
      inline = { adapter = "copilot" },
      agent = { adapter = "copilot" },
      cmd = { adapter = "copilot" },
    },
  })

  -- disable copilot in codecompanion buffers
  --
  local copilot_enabled = true

  vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = function()
      local ft = vim.bo.filetype
      if ft == "codecompanion" then
        if copilot_enabled then
          vim.cmd("Copilot disable")
          copilot_enabled = false
        end
      else
        if not copilot_enabled then
          vim.cmd("Copilot enable")
          copilot_enabled = true
        end
      end
    end,
  })

EOF

if has("nvim")
  Bundle 'Shougo/deoplete.nvim'
  let g:deoplete#enable_at_startup = 1

  Bundle 'vim-airline/vim-airline'
  let g:airline_powerline_fonts = 0
  let g:airline_theme='badwolf'
  "let g:airline_solarized_bg='dark'
  nmap <BS> <C-W>h

endif

" ----------------------------------------------------
" # set options
" ----------------------------------------------------
"
set history=1000
set hlsearch
set incsearch
set ignorecase
set smartcase
set number
set linebreak wrap nolist
"set showbreak=↪
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set linespace=1
set laststatus=2
set encoding=utf-8
set shiftround
set tabstop=2
"set showcmd
set mouse=

" remove trackpad
"
noremap <ScrollWheelUp> <nop>
noremap <S-ScrollWheelUp> <nop>
noremap <C-ScrollWheelUp> <nop>
noremap <ScrollWheelDown> <nop>
noremap <S-ScrollWheelDown> <nop>
noremap <C-ScrollWheelDown> <nop>
noremap <ScrollWheelLeft> <nop>
noremap <S-ScrollWheelLeft> <nop>
noremap <C-ScrollWheelLeft> <nop>
noremap <ScrollWheelRight> <nop>
noremap <S-ScrollWheelRight> <nop>
noremap <C-ScrollWheelRight> <nop>

set wildmenu
set tabpagemax=15
set novisualbell
set noautochdir
set shell=/bin/bash
" remove scrolls and everything
set guioptions-=L
set guioptions-=R
set guioptions-=r
set guioptions-=m
set guioptions-=T

scriptencoding utf-8
syntax on

if executable('ag')
  let g:ackprg='ag --nogroup --nocolor --column'
endif

" GitGutter styling to use · instead of +/-
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

" font
set gfn=Menlo:h14

" solarized colorscheme
"set background=dark
"let g:solarized_termcolors = 256
"let g:solarized_visibility = 'high'
"let g:solarized_contrast = 'high'
"colorscheme solarized

" prose mode
nmap <Leader>prose :Goyo<cr>

" tmux solorized
"set t_Co=16
"set background=dark " dark | light "
colorscheme solarized
"colorscheme nightfox
"colorscheme moonlight
"filetype plugin on

 "hard way?
"inoremap <Left>  <NOP>
"inoremap <Right> <NOP>
"inoremap <Up>    <NOP>
"inoremap <Down>  <NOP>

" vim-rspec
"let g:RspecBin = "bundle exec rspec"
" for vpc-specs options
"let g:RspecOpts = "--format nested"
"

" syntastic
" my ruby path for 1.9.3
"let g:syntastic_ruby_exec='~/.rbenv/shims/ruby'
let g:syntastic_enable_signs=1

set hidden
set nobackup
set noswapfile
set nowritebackup
set autoread
set noshowmode
"set autowrite
"set autowriteall

" ctrlp
"let g:ctrlp_custom_ignore = '\v[\/]\.(git)$'
"let g:ctrlp_extensions = ['dir', 'mixed']
"let g:ctrlp_working_path_mode = 0

" fzf
nmap ; :Buffers<CR>
nmap <Leader>p :Files<CR>
nmap <Leader>r :Tags<CR>

let g:vundle_default_git_proto = 'git'

" Disable beep and flash with vim
set noeb vb t_vb=

"" indentLine
"let g:indentLine_char = '⦙'
"let g:indentLine_color_gui = '#4e4e4e'
"let g:indentLine_showFirstIndentLevel = 0
"let g:indentLine_indentLevel = 4

" store undo history
set undofile
set undodir=~/.vim/undo
set undolevels=100
set undoreload=100000
" tmp/* without undok
" au BufWritePre /tmp/* setlocal noundofile

" for vim-javascript
let g:html_indent_inctags = 'html,body,head,tbody'
let g:html_indent_script1 = 'inc'
let g:html_indent_style1 = 'inc'

" Highlight current line in insert mode
au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
au WinLeave * setlocal nocursorline

" few colors
hi! WildMenu guibg=IndianRed
hi! CursorLineNr guibg=#073642 guisp=#eee8d5 guifg=NONE

" whitespaces cleaning
highlight ExtraWhitespace ctermbg=red guibg=IndianRed
au ColorScheme * highlight ExtraWhitespace guibg=IndianRed
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/
function! TrimWhiteSpace()
  %s/\s*$//
  ''
endfunction

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
au BufRead,BufNewFile *.pill setf ruby
au BufRead,BufNewFile *.rabl setf ruby
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setf nginx | endif
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown


" ----------------------------------------------------
" # keys mapping
" ----------------------------------------------------
"

" keys with leader
map <Leader>v :vsplit<cr>
map <Leader>g :split<cr>
map <Leader>q :q<cr>
map <Leader>w :w<cr>
map <Leader>wq :wq<cr>
map <Leader>- :resize -2<cr>
map <Leader>= :resize +2<cr>
map <Leader>_ :vertical resize -2<cr>
map <Leader>+ :vertical resize +2<cr>
"map <silent> <D-J> :resize +2<cr>
"map <silent> <D-H> :vertical resize -2<cr>
"map <silent> <D-L> :vertical resize +2<cr>
"map <silent> <D-K> :resize -2<cr>
map <Leader>tn :tabnew<cr>
map <Leader>tw :tabclose<cr>
map <leader>t1 1gt<cr>
map <Leader>t2 2gt<cr>
map <Leader>t3 3gt<cr>
map <Leader>t4 4gt<cr>
map <Leader>t5 5gt<cr>
map <Leader>t6 6gt<cr>
map <Leader>t7 7gt<cr>
"map <Leader>[ :tabprev<cr>

" navigate with splits
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" zoom current split
"nmap <D-S-cr> <c-w>o
"nmap <D-S> :call ZoomWinTabToggle()<cr>

" fix some map with !ri|!man...
"nmap K k

" add python powerline

"let g:python2_host_prog = '/usr/local/bin/python'
"let g:python3_host_prog = '/usr/local/bin/python3'

if !has("nvim")
  " enable powerline for old style vim
  set rtp+=~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim
endif

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
"set wildmode=list:longest,list:longest
set wildmode=list:longest
"set complete=.,w,t

" Not certain about this yet -- test it.
" Based on VIM tip 102: automatic tab completion of keywords
"function! InsertTabWrapper(dir)
    "let col = col('.') - 1
    "if !col || getline('.')[col - 1] !~ '\k'
  "return '\<tab>'
    "elseif 'back' == a:dir
  "return '\<c-p>'
    "else
  "return '\<c-n>'
    "endif
"endfunction

"inoremap <tab> <c-r>=InsertTabWrapper('fwd')<cr>
"inoremap <s-tab> <c-r>=InsertTabWrapper('back')<cr>

" exit from insert using kj
inoremap kj <Esc>

set clipboard=unnamed

" resize split
"map <silent> <D-j> :resize +2<cr>
"map <silent> <D-k> :resize -2<cr>

" move blocks in visual
vmap <C-h> <gv
vmap <C-l> >gv
vmap <C-j> :m'>+<cr>gv=`<my`>mzgv`yo`z
vmap <C-k> :m'<-2<cr>gv=`>my`<mzgv`yo`z

" quick edit self config
nmap <Leader>vim :e ~/.vimrc<cr>


" open project tree
nmap <silent> <Leader>t :NERDTreeToggle<cr>

" change EasyMotion Leader key
"let g:EasyMotion_leader_key = '<Leader>'

" clear whitespaces
nmap <silent> <Leader>o :call TrimWhiteSpace()<cr>

" clear search
nmap <Leader>[ :nohlsearch<cr>
nmap <Leader>? :nohlsearch<cr>

" open code companion
nmap <Leader>chat :CodeCompanionChat Toggle<cr>

" disable copilot
nmap <Leader>off :Copilot disable<cr>

" enable copilot
nmap <Leader>on :Copilot enable<cr>

" assist for selection
" Map <Leader>ass in visual mode to call CodeCompanion
xnoremap <silent> <Leader>chat :<C-u>'<,'>CodeCompanion 

" settings for copilot
"let g:copilot_no_tab_map = v:true
"imap <silent><expr> <C-l> copilot#Accept("\<CR>")
"imap <silent> <C-j> <Plug>(copilot-suggest)

imap <silent><expr> <C-l> copilot#Next()
imap <silent><expr> <C-h> copilot#Previous()

" for ctrlp
"nmap <Leader>p :CtrlP<cr>

" rspec
"let g:bundler_bin = '/Users/sletix/.rbenv/shims/bundle'
"let g:rspec_opt = g:bundler_bin . ' exec rspec --no-color'

"function! RSpecFile()
  "execute("!" . g:rspec_opt . " " .expand("%p"))
"endfunction
"map <leader>R :call RSpecFile() <CR>
"command! RSpecFile call RSpecFile()

"function! RSpecCurrent()
  "execute("!" . g:rspec_opt . " " . expand("%p") . ":" . line("."))
"endfunction
"map <leader>r :call RSpecCurrent() <CR>
"command! RSpecCurrent call RSpecCurrent()

"command! Bundler execute("!" . g:bundler_bin)

" jsonize
command! -range -nargs=0 -bar Jsonize <line1>,<line2>!python -m json.tool

" turn off folding
set nofoldenable

" delete all hidden buffers
function DeleteHiddenBuffers()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor
endfunction

command! CleanBuffers call DeleteHiddenBuffers()

" allow russian keys
"set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

command! WQ wq
command! Wq wq
command! W w
command! Q q

" disable copilot by default
"let g:copilot_enabled = v:false
