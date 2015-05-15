function ruby_s {
  port="${1:-9090}"
  ruby -run -e httpd . -p $port
}

function php_s {
  php -S localhost:8000
}

function pull_all {
  if [[ -a pull_all.rb ]]; then
    ruby pull_all.rb
  else
    echo 'No pull_all.rb in this directory.'
  fi
}

function deploy {
  ssh $1 './deploy'
}