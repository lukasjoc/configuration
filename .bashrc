# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

HISTSIZE=1000
HISTFILESIZE=2000

# random stuff I need globally or in my PATH
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

export effective_notes_init="$HOME/Sync/w/notes"
export EDITOR="vim"

# Rust
export RUST_SRC_PATH="$HOME/.cargo"
export PATH=$PATH:.cargo/bin

# Go
export GOPATH="$HOME/.go/"
export PATH=$PATH:$GOPATH/bin
export GO111MODULE=on

# LaTeX
export TEXMFHOME="$HOME/Library/texmf"

# EnvM stuff
export envm="$HOME/.envm"
export envm_wdir="$HOME/fun"
export envm_auto_update_days=7 # every 5 days envm is going to automatically update
source $envm/envm.sh

export mssql_shared="$HOME/fun/mssql-docker/shared"
alias sap="docker container start PlatinGUI750_PL1"

