function yarn --wraps yarn 
  command yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/yarnrc" $argv
end