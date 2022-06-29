function golint --wraps golangci-lint
  golangci-lint run -c $XDG_CONFIG_HOME/golangci-lint/config.yaml $argv
end