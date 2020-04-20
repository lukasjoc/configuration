" base config
filetype plugin indent on
syntax on
set nocompatible
set list
set number
set hlsearch
set ruler
set listchars=tab:\ \ ,trail:.
set tabstop=2 shiftwidth=2 expandtab
set encoding=utf-8
set backspace=indent,eol,start
set paste
set background=dark
" ==============================

" plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'wakatime/vim-wakatime'
	Plugin 'fatih/vim-go'
	Plugin 'cespare/vim-toml'
	Plugin 'posva/vim-vue'
" 	Plugin 'zah/nim.vim'
call vundle#end()
" ==============================

" automation, workflow
if has("autocmd")
  augroup  skels
		autocmd BufNewFile *.*sh 0r ~/.vim/skels/skel.sh
		autocmd BufNewFile *.py  0r ~/.vim/skels/skel.py
		autocmd BufNewFile *.js  0r ~/.vim/skels/skel.js
		autocmd BufNewFile *.md  0r ~/.vim/skels/skel.md
	augroup END
	augroup commenting
		autocmd FileType c,cpp,javascript,java,scala,go let b:comment_leader = "// "
		autocmd FileType vim                 let b:comment_leader = '" '
		autocmd FileType sh,yml,yaml,bash,python      let b:comment_leader = "# "
		autocmd FileType tex                 let b:comment_leader = "% "
		autocmd FileType sql                 let b:comment_leader = "-- "
		autocmd FileType tex set makeprg=pdflatex\ %
		autocmd FileType js set makeprg=node\ %
		autocmd FileType python set makeprg=python3\ %
	augroup END
" keymaps
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,xx :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
endif
" ==============================

