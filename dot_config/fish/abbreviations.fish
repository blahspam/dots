# https://fishshell.com/docs/current/cmds/abbr.html

# Navigation
abbr -a .. 'cd ..'
abbr -a ... 'cd ../../'
abbr -a .... 'cd ../../../'
abbr -a ..... 'cd ../../../../'
abbr -a - 'cd -'
abbr -a cdc 'cd $XDG_CONFIG_HOME'
abbr -a cdd 'cd $XDG_DATA_HOME'

abbr -a l 'eza -lao --git-repos-no-status --group --group-directories-first --no-permissions'
abbr -a ls 'eza'

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
abbr -a g 'git'
abbr -a gc 'git commit'
abbr -a gca --set-cursor "git commit -am '%'"
abbr -a gco 'git checkout'
abbr -a gps 'git push --set-upstream origin $(git branch --show-current)'
abbr -a wip "git commit -nam 'chore: wip'"

# Kube
abbr -a kb kubectl
abbr -a kbp 'kubectl get pods'
abbr -a kbd 'kubectl describe pod'
abbr -a kbs 'kubectl get svcs'
abbr -a kbc 'kubectx'

# Talos
abbr -a tl 'talosctl'
abbr -a tla 'talosctl apply -i'

# Terraform / OpenTofu
abbr -a tf tofu
abbr -a tfa 'tofu apply'
abbr -a tfd 'tofu destroy'

# Vault
abbr -a vleas 'vault login -method=oidc role=altcon_ci-owners'
abbr -a vlygg 'vault login -method=oidc role=yggdrasil_ci-owners_users'

# Miscellaneous
abbr -a cat 'bat'
abbr -a find 'fd'
abbr -a mvn 'mvn -gs $XDG_CONFIG_HOME/maven/settings.xml'
abbr -a tl 'talosctl'
abbr -a vim 'nvim'
