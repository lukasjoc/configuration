
call pathogen#infect()

" Packages $HOME/.vim/bundle
" tree -L 1 
" .
" |-- nim.vim
" |-- syntastic
" |-- toml
" |-- vim-go
" `-- vim-wakatime

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


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
		autocmd FileType vim let b:comment_leader = '" '
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
