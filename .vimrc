" Clearly overkill vim config
" Author: lukasjoc
" License: ISC as always

set nocompatible
call plug#begin('$HOME/.vim/plugged')
" Language Extensions
Plug 'fatih/vim-go'
Plug 'zah/nim.vim'
Plug 'Rican7/php-doc-modded'
Plug 'ollykel/v-vim'
Plug 'elixir-editors/vim-elixir'
Plug 'posva/vim-vue'
Plug 'pangloss/vim-javascript'
Plug 'rust-lang/rust.vim'
Plug 'lukasjoc/vim-fish'

" Other shit like linting, fixing, colors and
" time tracking
Plug 'lukasjoc/vim-colors'
Plug 'lukasjoc/vim-skels'
Plug 'wakatime/vim-wakatime'
Plug 'dense-analysis/ale'
call plug#end()

" Ale General
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '!'

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

" run linters on single filetype
let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}

" define lint on filetype
let g:ale_linters = {
\ 'javascript': ['eslint'],
\ 'vue': ['eslint'],
\}

" Php
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

" colorscheme fahrenheit
colorscheme orbital
syntax enable
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
	augroup Commenting
		au FileType c,cpp,rust,javascript,java,scala,go,php let b:comment_leader = "// "
		au FileType sh,yml,yaml,bash,python,nim let b:comment_leader = "# "
		au FileType vim let b:comment_leader = '" '
		au FileType tex let b:comment_leader = "% "
		au FileType sql let b:comment_leader = "-- "
	augroup END
	noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,"\/")<CR>/<CR>:nohlsearch<CR>
	noremap <silent> ,xx :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,"\/")<CR>//e<CR>:nohlsearch<CR>
endif

" Custom Commands and function
" Plug Stuff Cleanage and update
com! RunPlugStuff :PlugClean | PlugUpdate | PlugStatus

