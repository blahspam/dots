#! /usr/bin/env zsh

export HISTFILE="${XDG_DATA_HOME}/zsh/history"
export HISTSIZE=1000000000
export SAVEHIST=1000000000

setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history_time
unsetopt inc_append_history
unsetopt share_history

# zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
