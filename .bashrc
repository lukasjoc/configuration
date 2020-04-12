# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc) for examples
# mac optimized

HISTSIZE=1000
HISTFILESIZE=2000
export PATH="/usr/local/sbin:$PATH"
export EDITOR="vim"

# Rust
export RUST_SRC_PATH="$HOME/.cargo"
export PATH=$PATH:.cargo/bin

# Go
export GOPATH="$HOME/go/"
export PATH=$PATH:$GOPATH/bin
export GO111MODULE=on

# envm stuff
export envm="$HOME/.envm"
export envm_wdir="$HOME/fun"
export envm_auto_update_days=14 # every 14 days envm is going to automatically update
source $envm/init

case "$TERM" in
  xterm-color|*-256color) color_prompt=yes;;
esac

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# get current branch in git repo
function parse_git_branch() {
    local bra=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    if [ ! "${bra}" == "" ]
    then
        local sta=`parse_git_dirty`
        echo "(${bra}${sta}) "
    else
        echo ""
    fi
}

# get current status of git repo
function parse_git_dirty {
    local status=`git status 2>&1 | tee`
    local modified=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
    local bits=''
    if [ "${modified}" == "0" ]; then
        bits="*${bits}"
    fi
    if [ ! "${bits}" == "" ]; then
        echo " ${bits}"
    else
        echo ""
    fi
}

export PS1="\[\e[1;32m\]\u\[\e[m\]::\[\e[1;31m\]\h\[\e[m\] \[\e[1;10m\]\W\[\e[m\]\\$ \[\e[1;36m\]\`parse_git_branch\`\[\e[m\]"

# Trying macvim as vim replacement. I DOUT IT ;)_
alias vim="mvim -v"
