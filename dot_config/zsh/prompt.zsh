#! /usr/bin/env zsh

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '%F{green}+%f'
zstyle ':vcs_info:*' unstagedstr '%F{red}!%f'
zstyle ':vcs_info:*' formats ' (%F{blue}%b%f%c%u%m)'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked git-status git-remote

precmd() {
  vcs_info
}

function +vi-git-untracked() {
  if [[ -n $(git ls-files --others --exclude-standard) ]]; then
    hook_com[staged]+="%F{orange}?%f"
  fi
}

function +vi-git-remote() {
  local remote=$(git rev-parse --verify ${hook_com[branch]}@{upstream} --abbrev-ref 2>/dev/null)
  if [[ -n "${remote}" ]]; then
    hook_com[branch]="${remote}"
  fi
}

function +vi-git-status() {
  local st=$(git rev-list --left-right --count HEAD...@{upstream} 2>/dev/null)
  if ((${st[0]})); then
    hook_com[misc]+=" %F{red}↓${st[0]}%f"
  fi
  if ((${st[1]})); then
    hook_com[misc]+=" %F{green}↑${st[1]}%f"
  fi
}

setopt prompt_subst
PROMPT='%F{green}%M%f:%F{white}%2c%f${vcs_info_msg_0_} %F{yellow}$%f '
