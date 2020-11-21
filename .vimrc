" Vim ConfigurationG

call plug#begin('$HOME/.vim/plugged')

" Language Extensions
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'zah/nim.vim'
Plug 'Rican7/php-doc-modded'
Plug 'ollykel/v-vim'
Plug 'elixir-editors/vim-elixir'

" js and vue
Plug 'posva/vim-vue'
Plug 'pangloss/vim-javascript'

" Colors, appearance
Plug 'lukasjoc/vim-colors'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/syntastic'

" Time tracking
Plug 'wakatime/vim-wakatime'

" syntastic on steroids
Plug 'dense-analysis/ale'

call plug#end()

" Ale
"let g:ale_fix_on_save = 1
"let g:ale_completion_enabled = 122
"let g:ale_completion_autoimport = 1
"let g:ale_completion_autoimport = 1
"let g:ale_fixers.javascript = ['eslint']
"set omnifunc=ale#completion#OmniFunc

" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
map <C-c> :SyntasticCheck
let g:syntastic_aggregate_errors=1
let g:syntastic_sort_aggregate_errors=1
let g:syntastic_id_checkers = 1
let g:syntastic_cursor_column = 1
let g:syntastic_enable_signs = 1
let g:syntastic_enable_highlighting = 1
let g:syntastic_error_symbol = "X"
let g:syntastic_warning_symbol = "!!"
let g:syntastic_mode="active"
let g:syntastic_mode_map = { "mode": "active", "active_filetypes": ["php", "js"], "passive_filetypes": [] }

" php
let g:syntastic_php_checkers=1
unlet g:syntastic_php_checkers
let g:syntastic_php_checkers = ["php", "phpcs"]
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

" vue,js
let g:syntastic_javascript_checkers=1
unlet g:syntastic_javascript_checkers
let g:syntastic_javascript_checkers=["eslint", "prettier"]
let g:javascript_plugin_jsdoc = 1
let g:vue_pre_processors = ["scss"]

" python
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_checkers = ['python']

" Shell stuff
let g:syntastic_sh_shellcheck_args="-e SC1090"

" Lightline settings
set noshowmode
set laststatus=2
let g:lightline = {"colorscheme": "PaperColor"}
if !has("gui_running")
	set t_Co=256
endif

" wakatime settings
let g:wakatime_PythonBinary = "/bin/python"

" Autoformat
" au BufWrite * :Autoformat " on save is a mess
map <C-d> :Autoformat

set list listchars=tab:\ \ ,trail:.
set backspace=indent,eol,start

" use spaces with 4 indent on this system
filetype plugin indent on
set autoindent expandtab
set tabstop=4 softtabstop=-1 shiftwidth=4

set hidden
set number
set incsearch hlsearch smartcase
set pastetoggle=<C-t>
set encoding=utf-8
set viminfo='20,<1000,s1000

" colorscheme base
colorscheme fahrenheit
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
set shell=/usr/local/bin/bash

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

" " Swap it function and command
" fun! SwapIt(from, to)
" 	:%s/from/to/g
" endfun
" com! -nargs=* SwapIt call SwapIt(<f-args>)
"
