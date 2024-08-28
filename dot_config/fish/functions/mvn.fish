function mvn --wraps mvn
  command mvn -gs $XDG_CONFIG_HOME/maven/settings.xml $argv
end
