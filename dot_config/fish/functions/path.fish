function path -d "Print the $PATH variable in a readable format"
  echo $PATH | tr " " "\n" | nl
end
