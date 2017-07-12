#!/bin/bash

cd $HOME
# DIR PATHS
export DROPBOX="$HOME/Dropbox"
export WORKSPACE="$HOME/Workspace"

# DIR SHORTCUTS
alias down="cd ~/Downloads";

# projects
alias avod="cd $WORKSPACE/avod"
alias wavedata="cd $WORKSPACE/wavedata"
alias sid="cd $WORKSPACE/rnn_sysid"

# GIT ALIASES
alias gitlog="git log --graph \
    --abbrev-commit \
    --decorate \
    --date=relative \
    --format=format:'%C(bold blue)%h%C(reset) \
    - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' \
    --all"
