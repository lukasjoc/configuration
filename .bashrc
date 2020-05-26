# ~/.bashrc: executed for non-login shells.

HISTSIZE=1000
HISTFILESIZE=2000


export EDITOR="mvim"
export CLICOLOR=1

# random stuff I need globally or in my PATH
export PATH="/usr/local/bin:$PATH"

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

# Python 3.7
export PATH="$HOME/Library/Python/3.7/bin:$PATH"

# EnvM stuff
export envm="$HOME/.envm"
export envm_wdir="$HOME/fun"
export envm_auto_update_days=5
source $envm/envm.sh

export mssql_shared="$HOME/fun/mssql-docker/shared"
alias sap="docker container start PlatinGUI750_PL1"

