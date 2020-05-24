set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
Bundle "VundleVim/Vundle.vim"
Bundle "wakatime/vim-wakatime"
Bundle "fatih/vim-go"
Bundle "cespare/vim-toml"
Bundle "gmarik/vundle"
Bundle "scrooloose/syntastic"
Bundle "zah/nim.vim"

fun! JumpToDef()
  if exists("*GotoDefinition_" . &filetype)
    call GotoDefinition_{&filetype}()
  else
    exe "norm! \<C-]>"
  endif
endf
nn <M-g> :call JumpToDef()<cr>
ino <M-g> <esc>:call JumpToDef()<cr>i

filetype plugin indent on
set listchars=tab:\ \ ,trail:.
set tabstop=2 shiftwidth=2 noexpandtab
set backspace=indent,eol,start

set hidden
set list
set number
set hlsearch
set ruler
set paste

set encoding=utf-8
set background=dark
set belloff=all

" lets test this
set mouse=a

colorscheme koehler
syntax on

if has("autocmd")
  augroup  skels
		autocmd BufNewFile *.*sh 0r ~/.vim/skels/skel.sh
		autocmd BufNewFile *.py  0r ~/.vim/skels/skel.py
		autocmd BufNewFile *.js  0r ~/.vim/skels/skel.js
		autocmd BufNewFile *.md  0r ~/.vim/skels/skel.md
	augroup END
	augroup commenting
		autocmd FileType c,cpp,rust,javascript,java,scala,go let b:comment_leader = "// "
		autocmd FileType vim	let b:comment_leader = "" "
		autocmd FileType sh,yml,yaml,bash,python,nim	let b:comment_leader = "# "
		autocmd FileType tex	let b:comment_leader = "% "
		autocmd FileType sql	let b:comment_leader = "-- "
		autocmd FileType tex set makeprg=pdflatex\ %
		autocmd FileType js set makeprg=node\ %
		autocmd FileType python set makeprg=python3\ %
	augroup END

noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,"\/")<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,xx :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,"\/")<CR>//e<CR>:nohlsearch<CR>
endif


" ==============================


