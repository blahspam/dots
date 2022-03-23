#! /usr/bin/env zsh

###############################################################################
# general
###############################################################################

alias ..="cd .."
alias ...="cd ../.."
alias cdd="cd -"
alias chmod="chmod -v"
alias chown="chown -v"
alias cp="cp -v"
alias g="git"
alias hosts="sudo nvim /etc/hosts"
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias l="ls -lh"
alias ls="ls -AF --color=auto --quoting=literal"
alias mcd="mkdir -p '${1}' && cd '${1}'"
alias mkdir="mkdir -v"
alias mv="mv -v"
alias rm="rm -v"

###############################################################################
# docker
###############################################################################

alias dk="docker"
alias dkc="docker-compose"
alias dke="dk exec -it CONTAINERS bash"
alias dki="dk images -f dangling=false"
alias dkp="dk system prune -f"
alias dkr="dk run IMAGES"
alias dks='dk stop $(docker ps -aq)'
alias dkrmc='dk rm $(docker ps -aq)'
alias dkrmi='dk rmi -f $(docker images -q)'

alias -g CONTAINERS='$(dk ps --format="{{.ID}} - {{.Image}} ({{.Names}})" | fzf --height=8 --header-lines=0 --reverse | awk "{print \$1}")'
alias -g IMAGES='$(dki | fzf --height=8 --header-lines=1 --reverse | awk "{print \$1 \":\" \$2}")'

###############################################################################
# kube
###############################################################################

alias kb="kubectl"
alias kbc="kb config use-context CONTEXTS && tns"
alias kbdp="kb describe pod PODS"
alias kbds="kb describe service SERVICES"
alias kbe="kb exec -it PODS -- bash"
alias kbl="kb logs -f PODS"
alias kbp="kb get pods -o=wide"
alias kbs="kb get services -o=wide"

alias -g CONTEXTS='$(kb config get-contexts -o=name | sort -fs | fzf --height=8 --reverse --cycle)'
alias -g PODS='$(kbfzf pod)'
alias -g SERVICES='$(kbfzf svc)'

# fuzzy find a kube resource. (h/t @mnarrell)
function kbfzf() {
  kb get "$1" | fzf --height=8 --header-lines=1 --reverse | awk "{print \$1}"
}

# return the kube node ip/port for a service (if available)
function kbip() {
  # local node_ip=$(kubectl cluster-info | grep master | egrep -o '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}')
  local node_ip=$(kubectl get pods -l name=tiller -o wide | awk 'NR>1 {print $7}')
  local node_ports=$(kubectl get svc -o json SERVICES | jq -r '.spec.ports[] | "\(.name) \(.nodePort)"')
  if [[ $(echo "${node_ports}" | wc -l) -eq 1 ]]; then
    echo "${node_ports}" |
      awk -v ip="${node_ip}" '{print "http://" ip ":"$2}' > >(cat) > >(tr -d '\n' | pbcopy)
  else
    echo "${node_ports}" |
      awk -v OFS='\t' -v ip="${node_ip}" '{print $1, " http://" ip ":"$2}' |
      fzf-tmux --cycle |
      awk '{print $2}' > >(cat) > >(tr -d '\n' | pbcopy)
  fi
}

# port-forward a local port to the selectect container port
function kbpf() {
  local pod=$(kbfzf pod)
  local cport=$(kb get pod "${pod}" -o json | jq '.spec.containers | .[0].ports | .[0].containerPort')
  local lport
  if [[ -n ${1} ]]; then
    lport=${1}
  else
    lport=${cport}
  fi
  kb port-forward ${pod} ${lport}:${cport}
}

# update TILLER_NAMESPACE to match current kube context
function tns() {
  local ctx=$(kubectl config current-context)
  local cns=$(kubectl config view -o=jsonpath="{.contexts[?(@.name==\"${ctx}\")].context.namespace}")
  echo "${cns}" >"${HOME}/.tiller_namespace"
  export TILLER_NAMESPACE=${cns}
  echo "Switched Tiller namespace to ${cns}"
}

###############################################################################
# terraform
###############################################################################

alias tf='terraform'
alias tfi='terraform init'
alias tfa='terraform apply'
alias tfd='terraform destroy'
alias tg="terragrunt"