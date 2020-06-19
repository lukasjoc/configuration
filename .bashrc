# ~/.bashrc: executed for non-login shells.
# init defaults
source /etc/bashrc

shopt -s histappend
shopt -s checkwinsize

HISTSIZE=10000
HISTFILESIZE=20000

# On Linux systems the XDG paths are automatically set but on most darwin based and BSD based systems
# i found that these are not set anywhere.. /etc/bashrc or more
export XDG_CONFIG_HOME=$HOME/.config # configs
export XDG_CACHE_HOME=$HOME/.cache # user cache/meta data
export XDG_DATA_HOME=$HOME/.local/share # relevant user data

export EDITOR="vim"
export CLICOLOR=1

export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/Library/Python/3.7/bin:$PATH"
export PATH="/usr/local/opt/python@3.8/bin:$PATH"
	
# Rust
export RUST_SRC_PATH="$HOME/.cargo"
export RUSTBIN="$HOME/.cargo/bin"
export PATH=$RUST_SRC_PATH/bin:$PATH

# Go
export GOPATH="$HOME/.go/"
export GOBIN="$GOPATH/bin"
export GO111MODULE=on
export PATH=$GOPATH/bin:$PATH

# LaTeX
export TEXMFHOME="$HOME/Library/texmf"

# EnvM stuff
export envm="$HOME/.envm"
export envm_wdir="$HOME/fun"
export envm_auto_update_days=3
source $envm/envm

# set C-l command to clear terminal
bind -x '"\C-l": clear'
