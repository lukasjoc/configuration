" Vim Configuration
" Author: lukasjoc

call plug#begin('$HOME/.vim/plugged')

" Code Linting, Formatting, Tracking, Formatting
Plug 'scrooloose/syntastic'
Plug 'chiel92/vim-autoformat'
Plug 'wakatime/vim-wakatime'

" Language Extensions
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'posva/vim-vue'
Plug 'zah/nim.vim'
Plug 'Rican7/php-doc-modded'

" Color Scheme and Appearance
Plug 'fcpg/vim-fahrenheit'
Plug 'itchyny/lightline.vim'

call plug#end()

" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors=1
let g:syntastic_sort_aggregate_errors=1
let g:syntastic_id_checkers = 1
let g:syntastic_cursor_column = 1
let g:syntastic_enable_signs = 1
let g:syntastic_enable_highlighting = 1
let g:syntastic_error_symbol = "X"
let g:syntastic_warning_symbol = "!"
let g:syntastic_mode="active"
let g:syntastic_mode_map = { "mode": "active", "active_filetypes": ["php", "js"], "passive_filetypes": [] }

" Php Stuff
let g:syntastic_php_checkers=1
unlet g:syntastic_php_checkers
let g:syntastic_php_checkers = ["php", "phpcs"]

" php-doc-modded settings
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



" JS stuff
let g:syntastic_javascript_checkers=1
unlet g:syntastic_javascript_checkers
let g:syntastic_javascript_checkers=["eslint"]

" vue
let g:vue_pre_processors = ["scss"]


" Python stuff
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
let g:wakatime_PythonBinary = "/usr/local/bin/python3"

" autoformat"
" au BufWrite * :Autoformat " on save is a mess
map <C-d> :Autoformat

set list listchars=tab:\ \ ,trail:.
set backspace=indent,eol,start

" tabs with indent 2
filetype plugin indent on
set autoindent noexpandtab tabstop=2 softtabstop=-1 shiftwidth=2
"--FINALLY! - AFTER LONG HOURS WE DECIDED ON A MECHANISM TO space out our code
" WHAT A DAY :=) -

set hidden
set number
set incsearch hlsearch
set pastetoggle=<C-t>
set encoding=utf-8
set viminfo='20,<1000,s1000

colorscheme fahrenheit
" colorscheme codedark
" colorscheme unicon
" colorscheme spacecamp
syntax enable

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
		au FileType sh,yml,yaml,bash,python,nim	let b:comment_leader = "# "
		au FileType vim let b:comment_leader = '" '
		au FileType tex let b:comment_leader = "% "
		au FileType sql let b:comment_leader = "-- "
	augroup END
	noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,"\/")<CR>/<CR>:nohlsearch<CR>
	noremap <silent> ,xx :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,"\/")<CR>//e<CR>:nohlsearch<CR>

	augroup Makes
		au FileType tex set makeprg=pdflatex\ %
		au FileType js set makeprg=node\ %
		au FileType python set makeprg=python3\ %
		au FileType cpp set makeprg=g++\ %
		au FileType c set makeprg=gcc\ %
	augroup END

endif

" mmmh dont like it
" Disable Arrow keys in Normal mode
" map <up> <nop>
" map <down> <nop>
" map <left> <nop>
" map <right> <nop>
"
" " Disable Arrow keys in Insert mode
" imap <up> <nop>
" imap <down> <nop>
" imap <left> <nop>
" imap <right> <nop>
" 
