" Author: Lukas Jocham [https://lukasjoc.com]
" URL:	https://github.com/lukasjoc/dotfiles/tree/master/.vimrc
" License: MIT
" Last Change: 30.05.20
" Version: 1.0
" Descrition: Vim, MacVim configuration with pathogen as plugin manager, template files
" and commenting

" Pathogen Plugin Manager because vim-plug requires single quotes ;(
call pathogen#infect()

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
set background=dark
set belloff=all
set showcmd
set noswapfile
set nobackup
set autowrite
set autoread
set updatetime=300
set mouse=a

colorscheme unicon

syntax enable

if has("autocmd")
	
	augroup skels
		au BufNewFile *.*sh 0r $HOME/.vim/skels/skel
		au BufNewFile *.py 0r $HOME/.vim/skels/skel.py
		au BufNewFile *.js,*.ts 0r $HOME/.vim/skels/skel.js
		au BufNewFile *.md	0r $HOME/.vim/skels/skel.md
		au BufNewFile *.c 0r $HOME/.vim/skels/skel.c
		au BufNewFile *.html 0r $HOME/.vim/skels/skel.html
		au BufNewFile *.vue setfiletype html
		au BufNewFile *.vue 0r $HOME/.vim/skels/skel.vue
	augroup END
	
	augroup commenting
		au FileType c,cpp,rust,javascript,java,scala,go let b:comment_leader = "// "
		au FileType sh,yml,yaml,bash,python,nim				 let b:comment_leader = "# "
		au FileType vim let b:comment_leader = '" '
		au FileType tex let b:comment_leader = "% "
		au FileType sql let b:comment_leader = "-- "
	augroup END
	noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,"\/")<CR>/<CR>:nohlsearch<CR>
	noremap <silent> ,xx :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,"\/")<CR>//e<CR>:nohlsearch<CR>

	augroup makes
		au	FileType tex set makeprg=pdflatex\ %
		au	FileType js set makeprg=node\ %
		au	FileType python set makeprg=python3\ %
		au	FileType cpp set makeprg=g++\ %
		au	FileType c	set makeprg=gcc\  %	
	augroup END

endif

