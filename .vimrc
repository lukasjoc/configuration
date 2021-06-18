" Clearly overkill vim config
" Author: lukasjoc
" License: ISC as always

set nocompatible
call plug#begin('$HOME/.vim/plugged')

" Langs
Plug 'fatih/vim-go'
Plug 'zah/nim.vim'
Plug 'ollykel/v-vim'
Plug 'posva/vim-vue'
Plug 'pangloss/vim-javascript'
Plug 'rust-lang/rust.vim'
Plug 'vhda/verilog_systemverilog.vim'

" Etc
Plug 'lukasjoc/vim-colors'
Plug 'lukasjoc/vim-skels'
Plug 'wakatime/vim-wakatime'
Plug 'dense-analysis/ale'

call plug#end()

" Ale General
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_sign_error = '!!'
let g:ale_sign_warning = '*'

" Fixing
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\ 'javascript': ['eslint'],
\ 'vue': ['eslint']
\}

" Linting
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0 " dont lint when opening a file device
let g:ale_lint_on_save = 1
let g:ale_disable_lsp = 1

" run linters on single filetype
let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}

" define lint on filetype
let g:ale_linters = {
\ 'javascript': ['eslint'],
\ 'vue': ['eslint'],
\}

" PHP
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR>
let g:pdv_cfg_autoEndFunction = 0
let g:pdv_cfg_autoEndClass = 0
let g:pdv_cfg_annoation_Package = 0
let g:pdv_cfg_annoation_Version = 0
let g:pdv_cfg_annoation_Author = 0
let g:pdv_cfg_annoation_Copyright = 0
let g:pdv_cfg_annoation_License = 0

filetype indent on
set list listchars=tab:\ \ ,trail:.
set backspace=indent,eol,start
set autoindent
set expandtab
set shiftround
set smarttab
set tabstop=2 shiftwidth=2 softtabstop=-1
set ruler

set hidden
set number
set incsearch
set hlsearch
set smartcase
set pastetoggle=<C-t>
set encoding=utf-8
set viminfo='20,<1000,s1000

colorscheme fahrenheit
" colorscheme orbital
syntax enable
set colorcolumn=115
highlight ColorColumn ctermbg=darkgrey


if has('gui_running')
  "tell the term has 256 colors
  set t_Co=256
end

set linebreak
set scrolloff=45 sidescrolloff=5
set cursorline
set noerrorbells visualbell
set title
set nofoldenable
set confirm
set lazyredraw
set complete-=i

if has('autocmd')

  " Commenting
  augroup comment
    au FileType c,cpp,rust,javascript,java,pde,scala,go,php,v,sv,proto let b:comment_leader = "// "
    au FileType sh,yml,yaml,bash,python,pyx,nim let b:comment_leader = "# "
    au FileType vim let b:comment_leader = '" '
    au FileType tex let b:comment_leader = "% "
    au FileType sql let b:comment_leader = "-- "
  augroup END

  noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,"\/")<CR>/<CR>:nohlsearch<CR>
  noremap <silent> ,xx :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,"\/")<CR>//e<CR>:nohlsearch<CR>

  " Setting specific filetypes
  augroup filetypes
    au BufRead,BufNewFile *.h,*.c set filetype=c
    au BufRead,BufNewFile *.hpp,*.cpp,*.c++ set filetype=cpp
    au BufRead,BufNewFile *.v,*.sv set filetype=verilog
    au BufRead,BufNewFile *.js,*.ts,*.vue set filetype=javascript
    au BufRead,BufNewFile *.pde set filetype=java
  augroup END
endif

" Plug Stuff Cleanage and update
com! RunPlugStuff :PlugClean | PlugUpdate

