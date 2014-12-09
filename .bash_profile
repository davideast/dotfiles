function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}

PS1="\h:\W \u \$(parse_git_branch)\$ "

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\] \$(parse_git_branch)\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'

function simple_node_server {
  #!/bin/bash

  # We can also store arguments from bash command line in special array
  args=("$@")
  #echo arguments to the shell
  #echo ${args[0]} ${args[1]}

  # clone the repo using project name
  git clone https://github.com/spadin/simple-express-static-server ${args[0]}

  # cd into folder
  cd ${args[0]}

  # remove the old .git folder
  rm -rf .git

  # make a new .git repo
  git init

  # npm install
  npm install

  # each element in array
  # for loop
  shift
  for var in "$@"
  do
    bower install "$var" --save
  done
}

function react_boilerplate {
  # Store command arguments in an array
  args=("$@")
  #echo arguments to the shell

  # clone the repo using project name
  git clone https://github.com/davideast/react-boilerplate ${args[0]}

  # cd into folder
  cd ${args[0]}

  # remove the old .git folder
  rm -rf .git

  # make a new .git repo
  git init

  # npm install
  npm install
}

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_25.jdk/Contents/Home
export PATH=${PATH}:$HOME/gsutil
alias simns="simple_node_server"
alias fb="cd ~/firebase"
alias code="cd ~/Documents/Code/"
alias oss="cd ~/Documents/oss"
alias demos="cd ~/Documents/demos"
alias serve="python -m SimpleHTTPServer 8088"
alias react="react_boilerplate"
alias v2="cp -a ~/firebase/login-v2-test/. ."