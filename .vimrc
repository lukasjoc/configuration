" Location: $HOME/.vimrc
" Author: Lukas Jocham [https://lukasjoc.com]GGG
" Descrition: Vim configuration with vim-plug as plugin manager, template files
" and commenting

call plug#begin('~/.vim/plugged')
	Plug 'scrooloose/syntastic'
	Plug 'itchyny/lightline.vim'
	Plug 'cespare/vim-toml'
	Plug 'wakatime/vim-wakatime'
	
	" Go Setup
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

	Plug 'Rican7/php-doc-modded'
	
call plug#end()

" Syntastic Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_sh_shellcheck_args="-e SC1090"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors=1
let g:syntastic_sort_aggregate_errors=1
let g:syntastic_id_checkers=1
let g:syntastic_cursor_column=1
let g:syntastic_enable_signs=1
let g:syntastic_enable_highlighting=1
let g:syntastic_error_symbol='x'
let g:syntastic_warning_symbol='!'
let g:syntastic_mode='active'
let g:syntastic_php_checkers=1
let g:syntastic_mode_map={ 'mode': 'active', 'active_filetypes': ['php'], 'passive_filetypes': [] }
unlet g:syntastic_php_checkers
let g:syntastic_php_checkers = ["php", "phpcs"]
let g:syntastic_php_phpcs_args='--report=csv --standard=my_standard'

" Lightline Settings
if !has('gui_running')
  set t_Co=256
endif
set noshowmode
set laststatus=2
let g:lightline = { 'colorscheme': 'molokai' }

" Wakatime Settings
let g:wakatime_PythonBinary = '/usr/bin/python3'

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

filetype plugin indent on
set listchars=tab:\ \ ,trail:.
set tabstop=2 shiftwidth=2 noexpandtab
set backspace=indent,eol,start

set hidden
set list
set number
set incsearch hlsearch
set ruler
set paste

set encoding=utf-8
set belloff=all
set showcmd
set noswapfile
set nobackup
set autowrite
set autoread
set updatetime=300

set background=light
colorscheme unicon
syntax enable

set nocompatible
set viminfo='20,<1000,s1000

if has("autocmd")

	augroup Skels
		au BufNewFile *.*sh 0r $HOME/.vim/skels/skel
		au BufNewFile *.py 0r $HOME/.vim/skels/skel.py
		au BufNewFile *.js,*.ts 0r $HOME/.vim/skels/skel.js
		au BufNewFile *.md	0r $HOME/.vim/skels/skel.md
		au BufNewFile *.c 0r $HOME/.vim/skels/skel.c
		au BufNewFile *.cpp 0r $HOME/.vim/skels/skel.cpp
		au BufNewFile *.html 0r $HOME/.vim/skels/skel.html
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
		au FileType c set makeprg=gcc\  %
	augroup END
endif

