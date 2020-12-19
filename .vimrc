" Vim ConfigurationG

call plug#begin('$HOME/.vim/plugged')

" Language Extensions
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'zah/nim.vim'
Plug 'Rican7/php-doc-modded'
Plug 'ollykel/v-vim'
Plug 'elixir-editors/vim-elixir'
Plug 'posva/vim-vue'
Plug 'pangloss/vim-javascript'

" Colors, appearance
Plug 'lukasjoc/vim-colors'
Plug 'itchyny/lightline.vim'

" Time tracking
Plug 'wakatime/vim-wakatime'

" Syntastic on steroids
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
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:lightline#extensions#ale#enabled = 1

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
set noshowmode
set laststatus=2
let g:lightline = {"colorscheme": "PaperColor"}
if !has("gui_running")
	set t_Co=256
endif

" Wakatime settings
let g:wakatime_PythonBinary = "/bin/python"


"-------------
set list listchars=tab:\ \ ,trail:.
set backspace=indent,eol,start

filetype plugin indent on
set autoindent expandtab
set tabstop=2 softtabstop=-1 shiftwidth=2

set hidden
set number
set incsearch hlsearch smartcase
set pastetoggle=<C-t>
set encoding=utf-8
set viminfo='20,<1000,s1000


" colorscheme base
"
colorscheme fahrenheit
" colorscheme macvim
" colorscheme koehler
syntax enable

set linebreak
set scrolloff=45 sidescrolloff=5
set cursorline
set noerrorbells visualbell
set title
set nofoldenable
set confirm
set nomodeline

if has("autocmd")
	augroup Skels
		au BufNewFile *.*sh 0r $HOME/.vim/skels/skel
		au BufNewFile *.py 0r $HOME/.vim/skels/skel.py
		au BufNewFile *.js,*.ts 0r $HOME/.vim/skels/skel.js
		au BufNewFile *.c 0r $HOME/.vim/skels/skel.c
		au BufNewFile *.cpp 0r $HOME/.vim/skels/skel.cpp
		au BufNewFile *.html  0r $HOME/.vim/skels/skel.html
		au BufNewFile *.vue setfiletype html
		au BufNewFile *.vue 0r $HOME/.vim/skels/skel.vue
		au BufNewFile *.php 0r $HOME/.vim/skels/skel.php
	augroup END

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

