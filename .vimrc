" If started from fish shell use bash for best compatibility
if &shell =~# 'fish$'
  set shell=bash
endif

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
Plug 'lukasjoc/vim-fish' " my custo fish package

" Other shit
Plug 'lukasjoc/vim-colors' " my custom colors package
Plug 'lukasjoc/vim-skels' " my custom skel package
Plug 'wakatime/vim-wakatime'
Plug 'dense-analysis/ale'
call plug#end()

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_fixers = {
    \    "javascript": ["eslint", "prettier"],
\}
let g:ale_sign_error = 'e'
let g:ale_sign_warning = '!'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

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

" Vue
let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_linters = {'vue': ['eslint', 'vls']}

" Lightline settings
" set noshowmode
set laststatus=2
if !has("gui_running")
  set t_Co=256
endif

" Wakatime settings
set list listchars=tab:\ \ ,trail:.
set backspace=indent,eol,start

filetype indent on
set autoindent
set expandtab
set shiftround
set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=-1

set hidden
set number
set incsearch
set hlsearch
set smartcase
set pastetoggle=<C-t>
set encoding=utf-8
set viminfo='20,<1000,s1000

" colorscheme fahrenheit
" colorscheme wombat
colorscheme orbital
syntax enable

set linebreak
set scrolloff=45 sidescrolloff=5
set cursorline
set noerrorbells visualbell
set title
set nofoldenable
set confirm
set lazyredraw
set complete-=i

if has("autocmd")
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
com! RunPlugStuff :PlugClean | PlugUpdate

