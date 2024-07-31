# https://fishshell.com/docs/current/cmds/abbr.html

# Navigation
abbr -a .. 'cd ..'
abbr -a ... 'cd ../../'
abbr -a .... 'cd ../../../'
abbr -a ..... 'cd ../../../../'
abbr -a - 'cd -'
abbr -a cdxc 'cd $XDG_CONFIG_HOME'
abbr -a cdxd 'cd $XDG_DATA_HOME'

# Ansible
abbr -a agx ansible-galaxy
abbr -a apb ansible-playbook

# Chezmoi
abbr -a cm chezmoi
abbr -a cma 'chezmoi apply'
abbr -a cmu 'chezmoi update'

# Docker
abbr -a dk docker
abbr -a dkc docker-compose
abbr -a dkd 'docker-compose down'
abbr -a dkp 'docker-compose pull'
abbr -a dku 'docker-compose up'

# Flutter
abbr -a fl 'fvm flutter'
abbr -a flr 'fvm flutter run'

# Git
abbr -a gc 'git commit'
abbr -a gca 'git commit -a'
abbr -a gcam --set-cursor "git commit -am '%'"
abbr -a gco 'git checkout'
abbr -a gf 'git fetch'
abbr -a gpl 'git pull'
abbr -a gps 'git push'
abbr -a wip "git commit -nam 'chore: wip'"

# Kube
abbr -a kb kubectl
abbr -a kbp 'kubectl get pods'
abbr -a kbdp 'kubectl describe pod'
abbr -a kbs 'kubectl get svcs'
abbr -a kbc kubectx

# Terraform / Terragrunt
abbr -a tf terraform
abbr -a tfa 'terraform apply'
abbr -a tfd 'terraform destroy'
abbr -a tg terragrunt

# Miscellaneous
abbr -a src 'exec fish'
